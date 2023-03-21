import 'package:day5/providers/photos_provider.dart';
import 'package:day5/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pictures',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.brown),
        home: const Home(title: 'Pictures'),
      ),
    );
  }
}
