
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';

abstract class SuccessedResetPasswordController extends GetxController{
  goToLogin();
  
}

class SuccessedResetPasswordControllerImp extends SuccessedResetPasswordController{


  @override
  goToLogin() {
     Get.offAllNamed(RoutesApp.login);
  }


  
  

}