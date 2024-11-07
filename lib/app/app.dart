import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptos',
      home: HomeScreen(),
    );
  }
}
