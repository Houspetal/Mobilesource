import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/helper/cache/cache.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:grade_project/housepital/view/doctor/doctor_layout/doctor_main_page.dart';
import 'package:grade_project/housepital/view/widgets/custom_toast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/doctor_model.dart';

part 'doctor_profile_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileStates> {
  DoctorProfileCubit() : super(DoctorProfileInitial());
  static DoctorProfileCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  File profileImage = File("");

  Future<void> getProfileImageFromGallery(BuildContext context) async {
    emit(DoctorProfileUpdateImageLoadingState());
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      await FirebaseStorage.instance
          .ref()
          .child("doctors/${Uri.file(profileImage.path).pathSegments.last}")
          .putFile(profileImage)
          .then((image) {
        image.ref.getDownloadURL().then((profileImage) {
          FirebaseFirestore.instance.collection("Doctors").doc(uid).update({
            "image": profileImage,
          }).then((_) async {
            Map<String, dynamic> newJson = user!.toJson();
            newJson["image"] = profileImage;
            user = DoctorModel.fromJson(newJson);
            CacheHelper.setData(key: "user", value: json.encode(newJson))
                .then((value) {
              fieldController.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorMainPage(),
                  ),
                  (route) => false);
            });
          }).catchError((error) {
            emit(DoctorProfileUpdateFieldErrorState());
            getToast(text: error.toString(), state: ToastStates.ERROR);
          });
        });
      });
      getToast(
          text: "Image Updated Successfully !!!", state: ToastStates.SUCCESS);
    }
    emit(DoctorProfileUpdateImageSuccessState());
  }

  TextEditingController fieldController = TextEditingController();
  void updateField(
      {required String field,
      required String value,
      required BuildContext context}) {
    emit(DoctorProfileUpdateFieldLoadingState());
    FirebaseFirestore.instance.collection("Doctors").doc(uid).update({
      field: value,
    }).then((_) async {
      Map<String, dynamic> newJson = user!.toJson();
      newJson[field] = value;
      user = DoctorModel.fromJson(newJson);
      CacheHelper.setData(key: "user", value: json.encode(newJson))
          .then((value) {
        getToast(
            text: "$field updated Successfully", state: ToastStates.SUCCESS);
        emit(DoctorProfileUpdateFieldSuccessState());
        fieldController.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DoctorMainPage(),
            ),
            (route) => false);
      });
    }).catchError((error) {
      emit(DoctorProfileUpdateFieldErrorState());
      getToast(text: error.toString(), state: ToastStates.ERROR);
    });
  }
}
