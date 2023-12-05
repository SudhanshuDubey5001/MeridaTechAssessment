import 'package:flutter/material.dart';

class Utils{

  // reusable functions

  String getTodayDate(){
    DateTime now = DateTime.now();
    return "${now.day}-${now.month}-${now.year}";
  }

  String getNowTime(){
    DateTime now = DateTime.now();
    return "${now.hour}:${now.second}";
  }
}