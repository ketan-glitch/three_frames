import 'package:flutter/material.dart';
import 'package:three_frames/generated/assets.dart';
import 'package:three_frames/views/base/custom_button.dart';
import 'package:three_frames/views/screens/sing_in_screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Image(
            image: AssetImage(Assets.imagesLogo),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              type: ButtonType.primary,
              title: "Register",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              type: ButtonType.primary,
              title: "Login",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
