import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
import 'package:restaurant_template/app/modules/login_screen/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const SizedBox()
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: GetClipper(),
                        child: Container(
                          height: 250.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color.fromARGB(255, 27, 25, 25), Color.fromARGB(255, 10, 103, 116)],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 23.h),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Text(
                                  'Log in!',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.usernameController.value.text = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
                            hintText: "Email or Mobile",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.h,
                              ),
                            ),
                          ),
                          controller: controller.usernameController.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Usename";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.passwordController.value.text = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.h,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obscureText.value = !controller.obscureText.value;
                                },
                                child: Icon(
                                  controller.obscureText.value ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              )),
                          obscureText: controller.obscureText.value,
                          controller: controller.passwordController.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else if (value.length < 8) {
                              return 'Password length cannot be less than 8';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                validateAndSave();
                              },
                              child: Container(
                                height: 45,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  gradient: orangeGradient(),
                                ),
                                child: const Center(
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color.fromARGB(255, 172, 59, 61),
                              ),
                              child: const Center(
                                child: Text(
                                  'G+',
                                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      InkWell(
                        onTap: () {
                          Get.offAndToNamed(RouteName.dashboard);
                        },
                        child: const Text(
                          'Continue as Guest >',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not Signed up? ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.signup);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('form is invalid');
    }
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80.h);
    path.quadraticBezierTo(50, size.height - 20.h, size.width / 4 - 8.w, size.height - 50.h);
    path.quadraticBezierTo(size.width / 2.5, size.height / 2 + 20.h, size.width / 2 + 20.w, size.height - 60.h);
    path.quadraticBezierTo(size.width / 1.2, size.height + 40.h, size.width, size.height - 50.h);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
