part of 'crypto_cubit.dart';

@immutable
class CryptoState {
  final bool isLoading;
  final List<String> currencies;
  final String selectedAsset;
  final String e;
  final List<TrackedAsset> trackedAssets;
  final List<CoinData> coinData;
  final double portfolioValue;
  final String imageURL;

  const CryptoState({
    this.currencies = const [],
    this.isLoading = false,
    this.selectedAsset = '',
    this.trackedAssets = const [],
    this.portfolioValue = 0,
    this.coinData = const [],
    this.e = '',
    this.imageURL = '',
  });

  CryptoState copyWith({
    String? selectedAsset,
    List<String>? currencies,
    bool? isLoading,
  }) {
    return CryptoState(
      selectedAsset: selectedAsset ?? this.selectedAsset,
      currencies: currencies ?? this.currencies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final class CryptoInitialState extends CryptoState {
  const CryptoInitialState({
    super.selectedAsset = '',
    super.isLoading = false,
    super.currencies = const [],
  });
}

//* get currencies states
final class GetCurrenciesLoadingState extends CryptoState {
  const GetCurrenciesLoadingState({
    super.selectedAsset,
    super.isLoading = true,
    super.currencies = const [],
  });
}

final class GetCurrenciesSuccessState extends CryptoState {
  const GetCurrenciesSuccessState({
    required super.currencies,
    required super.selectedAsset,
    super.isLoading = false,
  });
}

final class GetCurrenciesFailureState extends CryptoState {
  const GetCurrenciesFailureState({
    required super.e,
    super.selectedAsset,
    super.isLoading = false,
    super.currencies = const [],
  });
}

//* refresh states
final class RefreshLoadingState extends CryptoState {
  const RefreshLoadingState({
    super.selectedAsset,
    super.currencies,
  });
}

final class RefreshSuccessState extends CryptoState {
  const RefreshSuccessState({
    required super.selectedAsset,
    required super.currencies,
  });
}

final class RefreshFailureState extends CryptoState {
  const RefreshFailureState({
    required super.e,
    super.currencies,
    super.selectedAsset,
  });
}

//* track asset states
final class AddTrackedAssetLoadingState extends CryptoState {
  const AddTrackedAssetLoadingState({
    super.trackedAssets,
    super.isLoading = true,
  });
}

final class AddTrackedAssetSuccessState extends CryptoState {
  const AddTrackedAssetSuccessState({
    required super.trackedAssets,
    super.isLoading = false,
  });
}

final class AddTrackedAssetFailureState extends CryptoState {
  const AddTrackedAssetFailureState({
    required super.e,
    super.isLoading = false,
    super.trackedAssets,
  });
}

//* get portfolio value states
final class GetPortfolioValueLoadingState extends CryptoState {
  const GetPortfolioValueLoadingState({
    super.isLoading = true,
    super.trackedAssets,
    super.portfolioValue,
    super.coinData,
  });
}

final class GetPortfolioValueSuccessState extends CryptoState {
  const GetPortfolioValueSuccessState({
    required super.portfolioValue,
    super.trackedAssets,
    super.coinData,
    super.isLoading = false,
  });
}

final class GetPortfolioValueEmptyState extends CryptoState {
  const GetPortfolioValueEmptyState({
    required super.portfolioValue,
    required super.coinData,
    super.trackedAssets,
    super.isLoading = false,
  });
}

final class GetPortfolioValueFailureState extends CryptoState {
  const GetPortfolioValueFailureState({
    required super.e,
    super.trackedAssets,
    super.isLoading = false,
    super.portfolioValue,
    super.coinData,
  });
}

//* get assets states
class GetAssetsSuccessState extends CryptoState {
  const GetAssetsSuccessState({required super.coinData});
}

class GetAssetsFailureState extends CryptoState {
  const GetAssetsFailureState({
    required super.e,
  });
}
