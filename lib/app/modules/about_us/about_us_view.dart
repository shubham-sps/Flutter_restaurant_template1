import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/modules/about_us/controller.dart';

class InfoScreen extends GetView<InfoController> {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: 1.sh,
            width: 1.sw,
            image: const AssetImage('assets/burger.png'),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 20, bottom: 10),
                  child: const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.65.sw,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      'Taj India Indian Restaurant offers delicious dining and takeout to Lexington, KY.Taj India Indian Restaurant is a cornerstone in the Lexington community and has been recognized for its outstanding Indian cuisine, excellent service and friendly staff. Our Indian restaurant is known for its modern interpretation of classic dishes and its insistence on only using high quality fresh ingredients.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
