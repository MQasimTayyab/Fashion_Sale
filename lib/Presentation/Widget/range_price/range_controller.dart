import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RangeController extends GetxController {
  Rx<RangeValues> currentRangeValues = RangeValues(40, 80).obs;

  void updateRange(RangeValues values) {
    currentRangeValues.value = values;
  }
}
