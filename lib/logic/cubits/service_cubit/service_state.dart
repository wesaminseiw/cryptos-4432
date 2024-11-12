part of 'service_cubit.dart';

@immutable
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceLoaded extends ServiceState {
  final HTTPService httpService;

  ServiceLoaded(this.httpService);
}

class ServiceError extends ServiceState {
  final String message;

  ServiceError(this.message);
}
