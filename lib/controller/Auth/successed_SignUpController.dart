
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';

abstract class SuccessedSignUpController extends GetxController{
  goToLogin();
  
}

class SuccessedSignUpControllerImp extends SuccessedSignUpController{


  @override
  goToLogin() {
     Get.offAllNamed(RoutesApp.login);
  }


  
  

}