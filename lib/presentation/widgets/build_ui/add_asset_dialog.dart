import 'dart:developer';

import 'package:cryptos/app/router.dart';
import 'package:cryptos/app/utils/extensions.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:cryptos/presentation/styles/colors.dart';
import 'package:cryptos/presentation/widgets/build_ui/build_add_asset_dialog_ui.dart';
import 'package:cryptos/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAssetDialog extends StatelessWidget {
  const AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: lightSecondaryColor,
          ),
          child: BlocBuilder<CryptoCubit, CryptoState>(
            builder: (context, state) {
              if (state is GetCurrenciesLoadingState || state is RefreshLoadingState || state is GetPortfolioValueEmptyState) {
                return loading();
              } else if (state is GetCurrenciesSuccessState || state is RefreshSuccessState || state is GetPortfolioValueSuccessState) {
                log(state.currencies.toString());
                return AddAssetDialogUI();
              } else {
                log('=============== FAILED TO LOAD ASSETS $state ===============');
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            onPressed: () async {
                              AppRouter.back();
                              await context.read<CryptoCubit>().getPortfolioValue();
                            },
                            icon: Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          state.e,
                          style: context.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
