import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  Rx<DateTime> selectedDateTime = (DateTime.now()).obs;
  final isDateSelected = false.obs;
  final isLoading = true.obs;
  RxInt selectedGuests = 0.obs;
  RxString bookingFor = 'Myself'.obs;
  RxString bookingItem = 'Table'.obs;
  final nameController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
}
