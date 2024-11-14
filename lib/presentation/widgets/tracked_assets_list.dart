import 'dart:developer';
import 'package:cryptos/app/router.dart';
import 'package:cryptos/app/utils/extensions.dart';
import 'package:cryptos/data/models/tracked_asset.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget trackedAssetsList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: BlocBuilder<CryptoCubit, CryptoState>(
      builder: (context, state) {
        if (state is AddTrackedAssetSuccessState || state is GetPortfolioValueSuccessState || state is GetPortfolioValueEmptyState) {
          log('SUCCESS == ${state.toString()}');
          if (state.trackedAssets.isEmpty || state is GetPortfolioValueEmptyState) {
            // log(state.trackedAssets.toString());
            return Center(
              child: Text(
                'No tracked assets found',
                style: context.headlineSmall,
              ),
            );
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
                  onTap: () {
                    AppRouter.toDetailsScreen(
                      context.read<CryptoCubit>().getCoinData(asset.name!)!,
                    );
                  },
                );
              },
            );
          }
        } else {
          log(state.toString());
          return Center(
            child: Text(
              'Failed to load tracked assets',
              style: context.headlineSmall,
            ),
          );
        }
      },
    ),
  );
}
