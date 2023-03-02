import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kintshop_task/models/login_model.dart';
import 'package:kintshop_task/models/register_model.dart';
import 'package:kintshop_task/screens/auth_screen/services/auth_services.dart';

class AuthController extends GetxController {
  AuthServices authServices = AuthServices();

  RxInt tabIndex = 0.obs;

  RxBool passwordVisibility = true.obs;
  RxBool gender = true.obs;
  RxBool registerLoadingStatue = false.obs;
  RxBool loginLoadingStatue = false.obs;

  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();

  sendRegisterInfoToService() async {
    try {
      changeLoadingStatue(registerLoadingStatue);

      RegisterModel? registerModel =
          await authServices.postRegisterInfoToService(
        nameController.text,
        surnameController.text,
        emailSignUpController.text,
        passwordSignUpController.text,
        mobilenumberController.text,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      changeLoadingStatue(registerLoadingStatue);
    }
  }

  sendLoginInfoToService() async {
    try {
      changeLoadingStatue(loginLoadingStatue);

      LoginModel? loginModel = await authServices.postLoginInfoToService(
        emailLoginController.text,
        passwordController.text,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      changeLoadingStatue(loginLoadingStatue);
    }
  }

  changeLoadingStatue(RxBool loadingStatue) {
    loadingStatue.value = !loadingStatue.value;
  }
}
