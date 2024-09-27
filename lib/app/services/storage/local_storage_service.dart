import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  LocalStorageService._();

  static final _cartbox = GetStorage('cartStorage');

  // create
  static Future writeValue(
      {required String key, required dynamic value}) async {
    await _cartbox.writeIfNull(key, value);
    await _cartbox.save();
  }

  // read
  static Future? readValue(String key) async => await _cartbox.read(key);

  // update
  static Future? addValue(
      {required String key, required dynamic newValue}) async {
    List? oldValue = _cartbox.read(key);
    if (oldValue != null) {
      if (oldValue.contains(newValue)) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Oops",
            message: "Item already added",
            duration: Duration(seconds: 1, milliseconds: 300),
          ),
        );
        return;
      }
      oldValue.add(newValue);
      await writeValue(key: key, value: oldValue);
      await _cartbox.save();
    }
  }

  // delete
  static Future? deleteValue(
      {required String key, required dynamic value}) async {
    List? oldValue = await _cartbox.read(key) as List?;
    if (oldValue != null) {
      oldValue.remove(value);
      await writeValue(key: key, value: oldValue);
      await _cartbox.save();
    }
  }
}
