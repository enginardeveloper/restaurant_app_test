part of 'app_director_bloc.dart';

abstract class AppDirectorEvent extends Equatable {
  const AppDirectorEvent();

  @override
  List<Object?> get props => [];
}

final class AppDirectorEventFetched extends AppDirectorEvent {
  const AppDirectorEventFetched();
}

final class AppDirectorEventFirstUseDisabled extends AppDirectorEvent {
  const AppDirectorEventFirstUseDisabled();
}