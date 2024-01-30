
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/class/Crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}