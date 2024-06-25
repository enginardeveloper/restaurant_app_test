part of 'table_service_bloc.dart';

abstract class TableServiceEvent extends Equatable {
  const TableServiceEvent();

  @override
  List<Object?> get props => [];
}

final class TableServiceEventFetched extends TableServiceEvent {
  const TableServiceEventFetched();
}
