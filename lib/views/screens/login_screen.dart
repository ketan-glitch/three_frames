import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/instance_manager.dart';

import '../../controllers/data_controller.dart';
import '../../generated/assets.dart';
import '../../services/extensions.dart';
import '../base/custom_button.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(Assets.imagesBack),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 32),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF667085),
                        ),
                    children: [
                      const TextSpan(
                        text: "Email Id ",
                      ),
                      TextSpan(
                        text: "*",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: email,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isEmail) {
                      return null;
                    } else {
                      return "Enter a valid Email Id";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [],
                  decoration: InputDecoration(
                    label: const Text("Enter email id"),
                    labelStyle: const TextStyle(color: Color(0XFF667085)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF667085),
                        ),
                    children: [
                      const TextSpan(
                        text: "Password ",
                      ),
                      TextSpan(
                        text: "*",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: password,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isPasswordPattern) {
                      return null;
                    } else {
                      return "Enter a valid Password";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [],
                  decoration: InputDecoration(
                    label: const Text("Enter password"),
                    labelStyle: const TextStyle(color: Color(0XFF667085)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                ),
                const Spacer(flex: 2),
                CustomButton(
                  type: ButtonType.primary,
                  title: "Login",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // Fluttertoast.showToast(msg: "Valid Email and Password");
                      Get.find<DataController>().login(email: email.text, password: password.text).then((value) {
                        if (value) {
                          Fluttertoast.showToast(msg: "Login Success");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                        } else {
                          Fluttertoast.showToast(msg: "Email or password in correct");
                        }
                      });
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPhoneScreen(number: number.text)));
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  type: ButtonType.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SignIn with ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                      const Image(
                        height: 30,
                        width: 30,
                        image: AssetImage(Assets.imagesGoogle),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.find<DataController>().handleSignIn().then((value) {
                      if (value) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      }
                    });
                  },
                ),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
