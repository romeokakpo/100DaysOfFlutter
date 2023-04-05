import 'package:day7/ui/screens/onboard.dart';
import 'package:day7/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/bindings/onboard_binding.dart';
import 'app/services/theme_service.dart';
import 'routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().theme,
      initialBinding: OnBoardBinding(),
      home: const OnBoard(),
      getPages: AppRouter.routes,
    );
  }
}
