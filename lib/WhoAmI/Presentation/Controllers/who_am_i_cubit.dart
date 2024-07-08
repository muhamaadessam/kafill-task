import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  WhoAmICubit() : super(WhoAmIInitial());
  bool rememberMe = false;
  bool hiddenPassword = true;
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
  List<bool> socialMediaCheck = [
    true,
    false,
    false,
  ];

  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  File? fileToDisplay;

  static WhoAmICubit get(context) => BlocProvider.of(context);


  changeShowPassword() {
    hiddenPassword = !hiddenPassword;
    emit(ChangeShowPasswordStatus());
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

}
