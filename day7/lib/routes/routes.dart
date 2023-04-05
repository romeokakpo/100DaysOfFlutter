import 'package:day7/ui/screens/home.dart';
import 'package:get/get.dart';

import '../app/bindings/home_binding.dart';

class Routes {
  static String home = "/home";
}

class AppRouter {
  static final routes = [
    GetPage(name: Routes.home, page: () => Home(), binding: HomeBinding())
  ];
}
