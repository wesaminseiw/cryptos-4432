import 'package:cryptos/app/utils/extensions.dart';
import 'package:cryptos/data/models/coin_data.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildDetailsScreenUI(
  BuildContext context, {
  required CoinData coin,
}) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          assetPrice(context, coin: coin),
          assetInfo(context, coin: coin),
        ],
      ),
    ),
  );
}

Widget assetPrice(
  BuildContext context, {
  required CoinData coin,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.1,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.network(context.read<CryptoCubit>().getCryptoImageURL(coin.name!)),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '\$ ${coin.values?.uSD?.price?.toStringAsFixed(2)}\n',
                style: context.headlineSmall,
              ),
              TextSpan(
                text: coin.values!.uSD!.percentChange24h! > 0
                    ? '+${coin.values?.uSD?.percentChange24h?.toStringAsFixed(2)} %'
                    : '${coin.values?.uSD?.percentChange24h?.toStringAsFixed(2)} %',
                style: context.bodyLarge!.copyWith(
                  color: coin.values!.uSD!.percentChange24h! > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget assetInfo(
  BuildContext context, {
  required CoinData coin,
}) {
  return Expanded(
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      children: [
        infoCard(
          context,
          title: 'Circulating Supply',
          subtitle: coin.circulatingSupply.toString(),
        ),
        infoCard(
          context,
          title: 'Maximum Supply',
          subtitle: coin.maxSupply.toString(),
        ),
        infoCard(
          context,
          title: 'Total Supply',
          subtitle: coin.totalSupply.toString(),
        ),
      ],
    ),
  );
}

Widget infoCard(
  BuildContext context, {
  required String title,
  required String subtitle,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.bodyLarge,
        ),
        Text(
          subtitle,
          style: context.bodyMedium,
        ),
      ],
    ),
  );
}
