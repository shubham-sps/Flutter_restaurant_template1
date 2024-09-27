import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var obscureText = true.obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final contactControlller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
}
