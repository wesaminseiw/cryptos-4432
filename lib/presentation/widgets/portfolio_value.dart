import 'package:cryptos/logic/cubits/get_currencies_cubit/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
