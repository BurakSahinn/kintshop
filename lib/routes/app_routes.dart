import 'package:get/get.dart';
import 'package:kintshop_task/constants/app_paths.dart';
import 'package:kintshop_task/screens/auth_screen/view/auth_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppPaths.pathOfAuthScreen,
      page: () => AuthScreen(),
    ),
  ];
}
