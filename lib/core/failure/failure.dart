import 'package:equatable/equatable.dart';

enum FailureStatus {
  none,
  serverFailure,
  connectionFailure,
  databaseFailure,
  noContentFailure,
  authenticationFailure,
}

final class Failure extends Equatable {
  final FailureStatus status;
  final String message;
  const Failure({this.message = 'unknown_error', this.status = FailureStatus.none});

  @override
  List<Object?> get props => [message, status];
}
