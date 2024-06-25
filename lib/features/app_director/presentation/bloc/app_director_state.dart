part of 'app_director_bloc.dart';

enum AppDirectorStatus { initial, loading, success, failure }

class AppDirectorState extends Equatable {

  final AppDirectorStatus appDirectorStatus;
  final Failure failure;
  final bool isFirstUse;

  const AppDirectorState({
    this.appDirectorStatus = AppDirectorStatus.initial,
    this.failure = const Failure(),
    this.isFirstUse = true,
  });

  @override
  List<Object?> get props => [failure, isFirstUse, appDirectorStatus,];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppDirectorState &&
          runtimeType == other.runtimeType &&
          appDirectorStatus == other.appDirectorStatus &&
          failure == other.failure &&
          isFirstUse == other.isFirstUse
          );

  @override
  int get hashCode =>
      appDirectorStatus.hashCode ^
      failure.hashCode ^
      isFirstUse.hashCode;


  @override
  String toString() {
    return 'AppDirectorState{' +
        ' appDirectorStatus: $appDirectorStatus,' +
        ' failure: $failure,' +
        ' isFirstUse: $isFirstUse,' +
        '}';
  }

  AppDirectorState copyWith({
    AppDirectorStatus? appDirectorStatus,
    Failure? failure,
    bool? isFirstUse,
  }) {
    return AppDirectorState(
      appDirectorStatus: appDirectorStatus ?? this.appDirectorStatus,
      failure: failure ?? this.failure,
      isFirstUse: isFirstUse ?? this.isFirstUse,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appDirectorStatus': this.appDirectorStatus,
      'failure': this.failure,
      'isFirstUse': this.isFirstUse,
    };
  }

  factory AppDirectorState.fromMap(Map<String, dynamic> map) {
    return AppDirectorState(
      appDirectorStatus: map['appDirectorStatus'] as AppDirectorStatus,
      failure: map['failure'] as Failure,
      isFirstUse: map['isFirstUse'] as bool,
    );
  }

//</editor-fold>
}