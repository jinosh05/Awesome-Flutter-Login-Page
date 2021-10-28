import 'package:flutter/material.dart';
import 'package:login_page/login_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }));
}
