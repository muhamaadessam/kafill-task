import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../BottomNavBar/Presentation/Components/custom_bottom_navigation_bar.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  bool rememberMe = false;
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  bool errorMessage = false;

  int salary = 0;
  String gender = 'Male';
  List<String> genderList = [
    'Male',
    'Female',
  ];
  String userType = 'Seller';
  List<String> userTypes = [
    'Seller',
    'Buyer',
    'Both',
  ];

  List<String> socialMediaTitle = [
    'Facebook',
    'Twitter',
    'LinkedIn',
  ];
  List<String> socialMediaLogo = [
    'assets/png/path14.png',
    'assets/png/twitter.png',
    'assets/png/linkedin.png',
  ];

  List<String> mySkills = [
    'Video Production',
    'Video Production',
    'Video Production',
  ];


  List<bool> socialMediaCheck = [
    false,
    false,
    false,
  ];

  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  File? fileToDisplay;

  static RegistrationCubit get(context) => BlocProvider.of(context);

  changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeStatus());
  }

  changeShowPassword() {
    hiddenPassword = !hiddenPassword;
    emit(ChangeShowPasswordStatus());
  }

  changeShowConfirmPassword() {
    hiddenConfirmPassword = !hiddenConfirmPassword;
    emit(ChangeShowPasswordStatus());
  }

  login(
    context, {
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const CustomBottomNavigationBar()),
        (route) => false);
    emit(SignUpSuccess());
    emit(SignUpError(error: 'error'));
  }

  registration(context) async {
    emit(SignUpLoading());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const CustomBottomNavigationBar()),
        (route) => false);
    emit(SignUpSuccess());

    // emit(SignUpError(error:'error'));
  }

  void pickFile() async {
    emit(PickFileLoadingState());
    try {
      result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        emit(PickFileSuccessState());
      }
      print(fileName);
      print(pickedFile);
    } catch (error) {
      emit(PickFileErrorState(error.toString()));
      print(error);
    }
  }

  increaseSalary() {
    salary = salary + 500;
    emit(ChangeSalaryStatus());
  }

  decreaseSalary() {
    if (salary > 0) {
      salary = salary - 500;
    }
    emit(ChangeSalaryStatus());
  }

  changeGender(String newGender) {
    gender = newGender;
    emit(ChangeGenderStatus());
  }

  changeSocialMediaCheck(int index) {
    socialMediaCheck[index] = !socialMediaCheck[index];
    emit(ChangeSocialMediaCheckStatus());
  }

  removeSkill(int index) {
    mySkills.remove(mySkills[index]);
    emit(RemoveSkillStatus());
  }

  showErrorMessage(bool show) {
    errorMessage = show;
    emit(ShowErrorMessageStatus());
  }
}
