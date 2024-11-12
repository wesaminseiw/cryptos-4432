import 'package:cryptos/app/router.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:cryptos/logic/cubits/service_cubit/service_cubit.dart';
import 'package:cryptos/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceCubit(),
        ),
        BlocProvider(
          create: (context) => CryptoCubit()
            ..getAssets()
            ..getPortfolioValue(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cryptos',
        themeMode: ThemeMode.light,
        theme: lightTheme(),
        // darkTheme: darkTheme(),
        home: const HomeScreen(),
        getPages: AppRouter.routes,
      ),
    );
  }
}
