import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:three_frames/controllers/data_controller.dart';
import 'package:three_frames/views/base/custom_button.dart';
import 'package:three_frames/views/screens/splash_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 24),
        child: Column(
          children: [
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Spacer(),
            GetBuilder<DataController>(builder: (dataController) {
              return Text(
                "${dataController.user?.email}",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              );
            }),
            const Spacer(flex: 5),
            CustomButton(
              type: ButtonType.secondary,
              title: "Logout",
              onTap: () {
                Get.find<DataController>()
                    .logout()
                    .then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SplashScreen()), (route) => false));
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
