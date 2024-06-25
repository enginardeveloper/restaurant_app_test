part of 'app_bloc.dart';

enum AppStatus { initial, loading, success, failure }

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {

  final AppStatus appStatus;
  final Failure failure;
  final AuthenticationStatus authenticationStatus;

  const AppState({
    this.appStatus = AppStatus.initial,
    this.failure = const Failure(),
    required this.authenticationStatus,
  });

  const AppState.authenticated()
      : this(authenticationStatus: AuthenticationStatus.authenticated,);

  const AppState.unauthenticated() : this(authenticationStatus: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [appStatus, failure, authenticationStatus];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppState &&
          runtimeType == other.runtimeType &&
          appStatus == other.appStatus &&
          failure == other.failure &&
          authenticationStatus == other.authenticationStatus);

  @override
  int get hashCode =>
      appStatus.hashCode ^
      failure.hashCode ^
      authenticationStatus.hashCode;

  @override
  String toString() {
    return 'AppState{' +
        ' appStatus: $appStatus,' +
        ' failure: $failure,' +
        ' authenticationStatus: $authenticationStatus,' +
        '}';
  }

  AppState copyWith({
    AppStatus? appStatus,
    Failure? failure,
    AuthenticationStatus? authenticationStatus,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      failure: failure ?? this.failure,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AppStatus': this.appStatus,
      'failure': this.failure,
      'authenticationStatus': this.authenticationStatus,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      appStatus: map['AppStatus'] as AppStatus,
      failure: map['failure'] as Failure,
      authenticationStatus: map['authenticationStatus'] as AuthenticationStatus,
    );
  }

//</editor-fold>
}

