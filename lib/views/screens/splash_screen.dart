import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:three_frames/controllers/data_controller.dart';
import 'package:three_frames/views/screens/dashboard.dart';
import 'package:three_frames/views/screens/welcome_screen.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<DataController>().initializeData();

    Future.delayed(const Duration(seconds: 2), () {
      if (Get.find<DataController>().isLoggedIn()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(),
          Image(
            image: AssetImage(Assets.imagesLogo),
          ),
          Spacer(),
          CircularProgressIndicator(
            color: Color(0XFF446E99),
            strokeWidth: 2,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
