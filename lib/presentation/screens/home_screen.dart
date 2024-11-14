import 'package:cryptos/presentation/widgets/appbar.dart';
import 'package:cryptos/presentation/widgets/build_ui/build_home_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.homeAppBar(context),
      body: buildHomeUI(context),
    );
  }
}
