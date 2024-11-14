import 'package:cryptos/presentation/widgets/portfolio_value.dart';
import 'package:cryptos/presentation/widgets/tracked_assets_list.dart';
import 'package:flutter/material.dart';

Widget buildHomeUI(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        Flexible(flex: 1, child: portfolioValue(context)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Divider(
            color: Colors.grey.shade400,
            height: 0.5,
          ),
        ),
        Flexible(flex: 2, child: trackedAssetsList(context)),
      ],
    ),
  );
}
