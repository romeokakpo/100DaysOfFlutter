import 'package:day6/providers/app_prrovider.dart';
import 'package:day6/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppProvider appState = context.watch<AppProvider>();
    bool mode = appState.mode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
          brightness: mode ? Brightness.light : Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(255, 46, 46, 47)),
      home: const Home(title: 'Calculator'),
    );
  }
}
