import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/signup_screen/controller.dart';
import 'package:restaurant_template/app/utils/local_widgets/color_pallete.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});
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
                          decoration: BoxDecoration(
                            gradient: oceanGradient(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 23.h),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                const Text(
                                  'Signup',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.passwordController.value.text = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                            labelText: "Full Name",
                            labelStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.h,
                              ),
                            ),
                          ),
                          controller: controller.nameController.value,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.nameController.value.text = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                            hintText: "Enter you email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.h,
                              ),
                            ),
                          ),
                          controller: controller.emailController.value,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.contactControlller.value.text = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Contact No.',
                            labelStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                            hintText: 'Enter you contact No.',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.h,
                              ),
                            ),
                          ),
                          controller: controller.contactControlller.value,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Contact No.";
                            } else if (value.length < 10) {
                              return "Contact Number must be of 10 digits";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.passwordController.value.text = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                      const SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                validateAndSave();
                              },
                              child: Container(
                                height: 50.0,
                                width: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  gradient: orangeGradient(),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(50, size.height - 20, size.width / 4 - 8, size.height - 50);
    path.quadraticBezierTo(size.width / 2.5, size.height / 2 + 20, size.width / 2 + 20, size.height - 60);
    path.quadraticBezierTo(size.width / 1.2, size.height + 40, size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
