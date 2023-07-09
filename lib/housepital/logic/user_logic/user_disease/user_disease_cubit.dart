import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/model/disease_model.dart';

part 'user_disease_state.dart';

class UserDiseaseCubit extends Cubit<UserDiseaseStates> {
  UserDiseaseCubit() : super(UserDiseaseInitial()) {
    getDiseases();
  }
  static UserDiseaseCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<DiseaseModel> diseases = [];

  void getDiseases() {
    diseases = [];
    emit(UserDiseaseGetDiseasesLoadingState());
    FirebaseFirestore.instance.collection("Diseases").get().then((value) {
      value.docs.forEach((element) {
        diseases.add(
          DiseaseModel.fromJson(
            element.data(),
          ),
        );
      });
      emit(UserDiseaseGetDiseasesSuccessState());
    }).catchError((error) {
      emit(UserDiseaseGetDiseasesErrorState());
    });
  }
}
