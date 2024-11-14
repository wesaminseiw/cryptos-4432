import 'package:cryptos/data/models/coin_data.dart';
import 'package:cryptos/presentation/widgets/appbar.dart';
import 'package:cryptos/presentation/widgets/build_ui/build_details_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final CoinData? coin;

  const DetailsScreen({super.key, this.coin});

  @override
  Widget build(BuildContext context) {
    final CoinData coin = Get.arguments;

    return Scaffold(
      appBar: AppBars.detailsScreenAppBar(context, coin: coin),
      body: buildDetailsScreenUI(context, coin: coin),
    );
  }
}
