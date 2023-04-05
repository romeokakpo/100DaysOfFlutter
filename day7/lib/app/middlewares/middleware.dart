import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (true) {
      return RouteSettings(name: Routes.home);
    }
  }
}
