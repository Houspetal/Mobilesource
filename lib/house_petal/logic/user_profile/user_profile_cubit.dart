import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/helper/cache/cache.dart';
import 'package:grade_project/house_petal/shared/constants/constants.dart';
import 'package:grade_project/house_petal/view/user/user_layout/main_page.dart';
import 'package:grade_project/house_petal/view/widgets/custom_toast.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/user_model.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitial());
  static UserProfileCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  File profileImage = File("");

  Future<void> getProfileImageFromGallery(BuildContext context) async {
    emit(UserProfileUpdateImageLoadingState());
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      await FirebaseStorage.instance
          .ref()
          .child("users/${Uri.file(profileImage.path).pathSegments.last}")
          .putFile(profileImage)
          .then((image) {
        image.ref.getDownloadURL().then((profileImage) {
          FirebaseFirestore.instance.collection("Users").doc(uid).update({
            "image": profileImage,
          }).then((_) async {
            Map<String, dynamic> newJson = user!.toJson();
            newJson["image"] = profileImage;
            user = UserModel.fromJson(newJson);
            CacheHelper.setData(key: "user", value: json.encode(newJson))
                .then((value) {
              fieldController.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                  (route) => false);
            });
          }).catchError((error) {
            emit(UserProfileUpdateFieldErrorState());
            getToast(text: error.toString(), state: ToastStates.ERROR);
          });
        });
      });
      getToast(
          text: "Image Updated Successfully !!!", state: ToastStates.SUCCESS);
    }
    emit(UserProfileUpdateImageSuccessState());
  }

  TextEditingController fieldController = TextEditingController();
  void updateField(
      {required String field,
      required String value,
      required BuildContext context}) {
    emit(UserProfileUpdateFieldLoadingState());
    FirebaseFirestore.instance.collection("Users").doc(uid).update({
      field: value,
    }).then((_) async {
      Map<String, dynamic> newJson = user!.toJson();
      newJson[field] = value;
      user = UserModel.fromJson(newJson);
      CacheHelper.setData(key: "user", value: json.encode(newJson))
          .then((value) {
        getToast(
            text: "$field updated Successfully", state: ToastStates.SUCCESS);
        emit(UserProfileUpdateFieldSuccessState());
        fieldController.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
            (route) => false);
      });
    }).catchError((error) {
      emit(UserProfileUpdateFieldErrorState());
      getToast(text: error.toString(), state: ToastStates.ERROR);
    });
  }
}
