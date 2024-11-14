import 'package:cryptos/app/router.dart';
import 'package:cryptos/app/utils/extensions.dart';
import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAssetDialogUI extends StatefulWidget {
  const AddAssetDialogUI({super.key});

  @override
  AddAssetDialogUIState createState() => AddAssetDialogUIState();
}

class AddAssetDialogUIState extends State<AddAssetDialogUI> {
  final TextEditingController _assetValueController = TextEditingController();

  @override
  void dispose() {
    _assetValueController.dispose(); // Remember to dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoCubit, CryptoState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    isExpanded: true,
                    value: state.selectedAsset,
                    items: state.currencies
                        .map(
                          (asset) => DropdownMenuItem(
                            value: asset,
                            child: Text(asset),
                          ),
                        )
                        .toList(),
                    onChanged: (value) async {
                      if (value != null) {
                        await context.read<CryptoCubit>().refresh(newSelectedAsset: value);
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: _assetValueController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  MaterialButton(
                    onPressed: () async {
                      context.read<CryptoCubit>().addTrackedAsset(
                            state.selectedAsset,
                            _assetValueController.text,
                          );
                      await context.read<CryptoCubit>().getPortfolioValue();
                      AppRouter.back();
                    },
                    color: context.colorScheme.primary,
                    child: Text(
                      'Add Asset',
                      style: context.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 42),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
