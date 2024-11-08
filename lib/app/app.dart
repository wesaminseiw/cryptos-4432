import 'package:cryptos/app/router.dart';
import 'package:cryptos/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../presentation/screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptos',
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HomeScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
