import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kintshop_task/constants/app_images.dart';
import 'package:kintshop_task/screens/auth_screen/controller/auth_controller.dart';
import 'package:kintshop_task/utilities/app_colors.dart';
import 'package:kintshop_task/utilities/app_radius.dart';
import 'package:kintshop_task/utilities/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: authController.tabIndex.value,
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                headImage(),
                tabBar(),
                SizedBox(
                  height: 68.h,
                  width: Get.width,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      loginColumn(),
                      signUpColumn(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding signUpColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 2.h,
      ),
      child: Wrap(
        runSpacing: 1.5.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextFieldHeader("Ad"),
                  customTextField(
                    authController.nameController,
                    5.h,
                    35.w,
                  ),
                ],
              ),
              SizedBox(width: 5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextFieldHeader("Soyad"),
                  customTextField(
                    authController.surnameController,
                    5.h,
                    35.w,
                  ),
                ],
              )
            ],
          ),
          customTextFieldHeader("E-Posta"),
          customTextField(
            authController.emailSignUpController,
            5.h,
            Get.width,
          ),
          customTextFieldHeader("Şifre"),
          customPasswordTextField(
            authController.passwordSignUpController,
          ),
          customTextFieldHeader("Cep Telefonu"),
          customTextField(
            authController.mobilenumberController,
            5.h,
            Get.width,
          ),
          customTextFieldHeader("Cinsiyetiniz"),
          genderSelectBox(),
          customButton("Kayıt Ol", () {
            authController.sendRegisterInfoToService();
          }),
        ],
      ),
    );
  }

  Obx genderSelectBox() {
    return Obx(
      () {
        return Row(
          children: [
            Text(
              "Kadın",
              style: AppTextStyles.normalTextStyle.copyWith(fontSize: 10.0.sp),
            ),
            Checkbox(
              value: authController.gender.value,
              activeColor: AppColors.orangeColor,
              onChanged: (value) {
                authController.gender.value = value!;
              },
            ),
            Text(
              "Erkek",
              style: AppTextStyles.normalTextStyle.copyWith(fontSize: 10.0.sp),
            ),
            Checkbox(
              value: !authController.gender.value,
              activeColor: AppColors.orangeColor,
              onChanged: (value) {
                authController.gender.value = !value!;
              },
            ),
          ],
        );
      },
    );
  }

  Padding loginColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 2.h,
      ),
      child: Wrap(
        runSpacing: 1.5.h,
        children: [
          customTextFieldHeader("E-Posta"),
          customTextField(authController.emailLoginController, 5.h, Get.width),
          customTextFieldHeader("Şifre"),
          customPasswordTextField(authController.passwordController),
          forgetPasswordButton(),
          customButton("Giriş Yap", () {
            authController.sendLoginInfoToService();
          }),
          otherOptions(),
          socialMediaLogos(),
          navigateSignUpButton()
        ],
      ),
    );
  }

  Row navigateSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Üye değil misin?",
          style: AppTextStyles.normalTextStyle.copyWith(fontSize: 10.0.sp),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Kayıt Ol",
              style: AppTextStyles.boldTextStyle.copyWith(
                color: AppColors.orangeColor,
                fontSize: 10.0.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row socialMediaLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.facebookImage,
          scale: 12.sp,
        ),
        SizedBox(
          width: 3.w,
        ),
        Image.asset(
          AppImages.googleImage,
          scale: 12.sp,
        ),
      ],
    );
  }

  Container otherOptions() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Diğer Seçenekler",
        style: AppTextStyles.normalTextStyle.copyWith(fontSize: 10.0.sp),
      ),
    );
  }

  Container customButton(String text, void Function()? onPressed) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.orangeColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.boldTextStyle.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Container forgetPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Şifremi Unuttum",
          style: AppTextStyles.boldTextStyle.copyWith(
            color: AppColors.orangeColor,
            fontSize: 10.0.sp,
          ),
        ),
      ),
    );
  }

  Container customTextField(
    TextEditingController controller,
    double height,
    double width,
  ) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.1),
        borderRadius: AppRadius.containerRadius,
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        autofocus: false,
      ),
    );
  }

  Obx customPasswordTextField(TextEditingController controller) {
    return Obx(() {
      return Container(
        height: 6.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.1),
          borderRadius: AppRadius.containerRadius,
        ),
        child: TextField(
          obscureText: authController.passwordVisibility.value,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                authController.passwordVisibility.value =
                    !authController.passwordVisibility.value;
              },
              icon: Icon(
                !authController.passwordVisibility.value == true
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      );
    });
  }

  Text customTextFieldHeader(String text) {
    return Text(
      text,
      style: AppTextStyles.normalTextStyle,
    );
  }

  SizedBox headImage() {
    return SizedBox(
      height: 20.h,
      width: Get.width,
      child: Image.asset(
        AppImages.kintshopImage,
        fit: BoxFit.fill,
      ),
    );
  }

  SizedBox tabBar() {
    return SizedBox(
      height: 8.h,
      width: Get.width,
      child: ColoredBox(
        color: AppColors.orangeColor,
        child: TabBar(
          labelColor: AppColors.orangeColor,
          unselectedLabelColor: AppColors.whiteColor,
          automaticIndicatorColorAdjustment: false,
          indicator: const BoxDecoration(color: Colors.white),
          labelStyle: AppTextStyles.boldTextStyle.copyWith(fontSize: 14.0.sp),
          tabs: const [
            Tab(
              text: "Giriş",
            ),
            Tab(
              text: "Kayıt Ol",
            ),
          ],
        ),
      ),
    );
  }
}
