import 'package:cryptos/data/models/coin_data.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:cryptos/presentation/styles/colors.dart';
import 'package:cryptos/presentation/widgets/build_ui/add_asset_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AppBars {
  static PreferredSizeWidget homeAppBar(BuildContext context) {
    return AppBar(
      title: const CircleAvatar(
        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.dialog(
              const AddAssetDialog(),
              barrierDismissible: false,
            );
            context.read<CryptoCubit>().getCurrencies();
          },
          icon: Icon(
            Icons.add,
            color: lightTertiaryColor,
          ),
        ),
      ],
    );
  }

  static PreferredSizeWidget detailsScreenAppBar(
    BuildContext context, {
    required CoinData coin,
  }) {
    return AppBar(
      title: Text(coin.name!),
      centerTitle: true,
    );
  }
}
