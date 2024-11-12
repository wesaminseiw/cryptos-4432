import 'dart:developer';
import 'package:cryptos/app/utils/extensions.dart';
import 'package:cryptos/data/models/tracked_asset.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:cryptos/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CryptoCubit().getPortfolioValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: buildUI(context),
    );
  }

  Widget buildUI(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          portfolioValue(context),
          Flexible(
            child: trackedAssetsList(context),
          ),
        ],
      ),
    );
  }

  Widget portfolioValue(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Center(
        child: BlocBuilder<CryptoCubit, CryptoState>(
          builder: (context, state) {
            return Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  const TextSpan(
                    text: '\$',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '${state.portfolioValue.toStringAsFixed(2)}\n',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(
                    text: 'Portfolio value',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget trackedAssetsList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<CryptoCubit, CryptoState>(
        builder: (context, state) {
          if (state is AddTrackedAssetSuccessState || state is GetPortfolioValueSuccessState || state is GetPortfolioValueEmptyState) {
            log('SUCCESS == ${state.toString()}');
            if (state.trackedAssets.isEmpty || state is GetPortfolioValueEmptyState) {
              // log(state.trackedAssets.toString());
              return Text('No tracked assets found.');
            } else {
              log(state.trackedAssets.toString());
              return ListView.builder(
                itemCount: state.trackedAssets.length,
                itemBuilder: (context, index) {
                  TrackedAsset asset = state.trackedAssets[index];
                  return ListTile(
                    titleTextStyle: context.headlineSmall,
                    subtitleTextStyle: context.bodyMedium,
                    leading: Image.network(context.read<CryptoCubit>().getCryptoImageURL(asset.name!)),
                    title: Text(asset.name ?? 'Unknown Asset'),
                    subtitle: Text('USD: ${context.read<CryptoCubit>().getAssetPrice(asset.name!).toStringAsFixed(2)}'),
                    trailing: Text(
                      '${asset.amount}',
                      style: context.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            log(state.toString());
            return Text('Failed to add asset');
          }
        },
      ),
    );
  }
}
