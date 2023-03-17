import 'dart:async';

import 'package:chat_bot_app/view/login.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Image.asset(
                    'assets/avt.png',
                    height: 100,
                    //width: 100.0,
              ),
      ),
    );
  }
}
