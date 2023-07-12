// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:simple_calculator/Controller/calculatorController.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatorController());
  }
}
