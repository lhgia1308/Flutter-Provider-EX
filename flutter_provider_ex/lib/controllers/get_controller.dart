import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class GetController extends GetxController {
  int currentSlider = 0;
  void setCurrentSilder(int? index) {
    currentSlider = index!;
    update();
  }

  void increaseSlider(int step) {
    currentSlider = currentSlider + step;
    update();
  }
}
