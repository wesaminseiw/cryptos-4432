import 'package:cryptos/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

Widget loading() {
  return const SizedBox(
    height: 56,
    child: Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: lightPrimaryColor,
          strokeWidth: 3,
        ),
      ),
    ),
  );
}
