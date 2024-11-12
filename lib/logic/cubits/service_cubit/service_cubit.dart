import 'package:bloc/bloc.dart';
import 'package:cryptos/app/services/http_service.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  Future<void> registerServices() async {
    try {
      HTTPService httpService = HTTPService();
      emit(ServiceLoaded(httpService));
    } catch (e) {
      emit(ServiceError('Service registration failed'));
    }
  }
}
