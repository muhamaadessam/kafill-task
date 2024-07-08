import 'package:flutter/cupertino.dart';

double heightRation(context, double height) =>
    MediaQuery.sizeOf(context).height * height / 812;

double widthRation(context, double width) =>
    MediaQuery.sizeOf(context).width * width / 375;
