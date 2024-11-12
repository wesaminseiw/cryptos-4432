import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cryptos/app/services/http_service.dart';
import 'package:cryptos/data/models/api_response.dart';
import 'package:cryptos/data/models/coin_data.dart';
import 'package:cryptos/data/models/tracked_asset.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:get/get.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit() : super(const CryptoInitialState());

  // List to keep tracked assets persistent across calls
  List<TrackedAsset> _trackedAssets = [];
  List<String> _currencies = [];
  List<CoinData> _coinData = [];

  // Fetch available assets
  Future<void> getAssets() async {
    log('getAssets() called');
    try {
      HTTPService httpService = HTTPService();
      final responseData = await httpService.get('currencies');
      CurrenciesListAPIResponse currenciesListAPIResponse = CurrenciesListAPIResponse.fromJson(responseData);
      _coinData = currenciesListAPIResponse.data ?? [];
      log('getAssets() - Fetched data: $_coinData');
      emit(GetAssetsSuccessState(coinData: _coinData));
      // Call getPortfolioValue after assets are fetched
      getPortfolioValue();
    } catch (e) {
      log('getAssets() - Error: $e');
      emit(GetAssetsFailureState(e: e.toString()));
    }
  }

  // Get list of currencies
  Future<void> getCurrencies() async {
    log('getCurrencies() called');
    emit(const GetCurrenciesLoadingState());
    try {
      _currencies.clear();
      HTTPService httpService = HTTPService();
      final responseData = await httpService.get('currencies');
      CurrenciesListAPIResponse currenciesListAPIResponse = CurrenciesListAPIResponse.fromJson(responseData);

      currenciesListAPIResponse.data?.forEach((coin) {
        if (coin.name != null) _currencies.add(coin.name!);
      });

      log('getCurrencies() - Loaded assets: $_currencies');
      if (_currencies.isNotEmpty) {
        String _selectedAsset = _currencies.first;
        // await getPortfolioValue();
        emit(GetCurrenciesSuccessState(currencies: _currencies, selectedAsset: _selectedAsset));
      } else {
        emit(GetCurrenciesFailureState(e: 'No currencies available.'));
      }
    } catch (e) {
      log('getCurrencies() - Error: $e');
      emit(GetCurrenciesFailureState(e: e.toString()));
    }
  }

  // Add a tracked asset
  Future<void> addTrackedAsset(String name, String amount) async {
    log('addTrackedAsset() called with asset: $name, amount: $amount');
    emit(AddTrackedAssetLoadingState());
    try {
      double _amount = double.parse(amount);
      // Add the new tracked asset to the persistent list
      _trackedAssets.add(TrackedAsset(name: name, amount: _amount));
      log('addTrackedAsset() - Tracked assets: ${_trackedAssets.map((asset) => asset.toString()).join(', ')}');

      // Emit success state with a new list, not a reference
      emit(AddTrackedAssetSuccessState(trackedAssets: List.from(_trackedAssets))); // <-- Use List.from() to create a new list

      // After adding a new asset, recalculate portfolio value
      getPortfolioValue();
    } catch (e) {
      log('addTrackedAsset() - Error: $e');
      emit(AddTrackedAssetFailureState(e: e.toString()));
    }
  }

  // Refresh assets (re-fetch or reset)
  Future<void> refresh({required String newSelectedAsset}) async {
    log('refresh() called with asset: $newSelectedAsset');
    try {
      emit(RefreshLoadingState(selectedAsset: newSelectedAsset));
      emit(RefreshSuccessState(selectedAsset: newSelectedAsset, currencies: _currencies));
      log('refresh() - Success');
    } catch (e) {
      log('refresh() - Error: $e');
      emit(RefreshFailureState(e: e.toString()));
    }
  }

  // Get the portfolio value based on tracked assets and their current prices
  Future<void> getPortfolioValue() async {
    log('getPortfolioValue() called');

    // Check if the necessary data is available
    if (_coinData.isEmpty) {
      log('getPortfolioValue() - No CoinData available');
      emit(
        GetPortfolioValueEmptyState(
          portfolioValue: 0,
          coinData: const [],
          trackedAssets: const [],
        ),
      );
      return;
    }
    if (_trackedAssets.isEmpty) {
      log('getPortfolioValue() - No Tracked Assets available');
      emit(
        GetPortfolioValueEmptyState(
          portfolioValue: 0,
          coinData: const [],
          trackedAssets: const [],
        ),
      );
      return;
    }

    // Calculating portfolio value
    emit(GetPortfolioValueLoadingState(trackedAssets: const []));
    try {
      double _value = 0;
      for (TrackedAsset asset in _trackedAssets) {
        _value += getAssetPrice(asset.name!) * asset.amount!;
      }

      log('getPortfolioValue() - Calculated value: $_value');
      emit(
        GetPortfolioValueSuccessState(
          portfolioValue: _value,
          trackedAssets: _trackedAssets,
        ),
      );
    } catch (e) {
      log('getPortfolioValue() - Error: $e');
      emit(
        GetPortfolioValueFailureState(
          e: e.toString(),
          trackedAssets: const [],
        ),
      );
    }
  }

  // Get the price for a specific asset
  double getAssetPrice(String name) {
    CoinData? data = getCoinData(name);
    double price = data?.values?.uSD?.price?.toDouble() ?? 0;
    log('getAssetPrice() - Price for $name: $price');
    return price;
  }

  // Get the coin data for a specific asset by name
  CoinData? getCoinData(String name) {
    CoinData? coinData = _coinData.firstWhereOrNull((e) => e.name == name);
    if (coinData == null) {
      log('getCoinData() - Coin data for $name not found');
    }
    return coinData;
  }

  String getCryptoImageURL(String name) {
    return 'https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/refs/heads/master/128/${name.toLowerCase()}.png';
  }
}
