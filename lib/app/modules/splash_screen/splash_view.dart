import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/splash_screen/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.w,
          // duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
