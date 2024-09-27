import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_template/app/app_pages.dart';

class BuildMenuItems extends StatelessWidget {
  const BuildMenuItems({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    var dH = MediaQuery.of(context).size.height / 100;
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 14.h,
        children: [
          Center(
            child: SizedBox(
              height: 150.h,
              child: Icon(
                Icons.food_bank,
                size: dH * 20,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.photo, size: 25.h, color: Colors.white),
            title: const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.profile);
            },
          ),
          ListTile(
            leading: Icon(Icons.discount, size: 25.h, color: Colors.white),
            title: const Text(
              'Offers',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.offers);
            },
          ),
          ListTile(
            leading: Icon(Icons.dining_sharp, size: 25.h, color: Colors.white),
            title: const Text(
              'Your Orders',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.orders);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_add,
              size: 25.h,
              color: Colors.white,
            ),
            title: const Text(
              'Your Bookings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.bookings);
            },
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, size: 25.h, color: Colors.white),
            title: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              // Get.offAndToNamed(RouteName.dashboard);
              //  Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book, size: 25.h, color: Colors.white),
            title: const Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.menu);
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark_add, size: 25.h, color: Colors.white),
            title: const Text(
              'Reservation',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.reservations);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, size: 25.h, color: Colors.white),
            title: const Text(
              'Contact Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.contact);
            },
          ),
          ListTile(
            leading: Icon(Icons.image, size: 25.h, color: Colors.white),
            title: const Text(
              'About Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.aboutUs);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, size: 25.h, color: Colors.white),
            title: const Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            onTap: () {
              Get.offAndToNamed(RouteName.login);
            },
          )
        ],
      ),
    );
  }
}
