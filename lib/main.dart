import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';

String cartKey = "cart";

void main() {
  // Stripe.publishableKey = 'pk_test_51ObfkYSIOzaVVU17wCwTjQrqbYoWXp58DQfiDtYVFBR1mpBcxbxNsa7yASTwSP2kCCxeOdEGxpvrzncGME8PPAbP00EDoujOsp';
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splash,
        getPages: AppPages.pages,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: Typography.whiteHelsinki,
          appBarTheme: const AppBarTheme(
              color: Colors.black,
              iconTheme: IconThemeData(
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
