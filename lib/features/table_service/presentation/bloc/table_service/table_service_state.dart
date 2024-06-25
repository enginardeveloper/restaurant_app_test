part of 'table_service_bloc.dart';

enum TableServiceStatus { initial, loading, success, failure }

class TableServiceState extends Equatable {
  final TableServiceStatus tableServiceStatus;
  final Failure failure;
  final List<TableServiceEntity> tableServiceEntityList;

  @override
  List<Object?> get props => [tableServiceStatus, failure, ];

//<editor-fold desc="Data Methods">
  const TableServiceState({
    this.tableServiceStatus = TableServiceStatus.initial,
    this.failure = const Failure(),
    this.tableServiceEntityList = const <TableServiceEntity>[],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableServiceState &&
          runtimeType == other.runtimeType &&
          tableServiceStatus == other.tableServiceStatus &&
          failure == other.failure &&
          tableServiceEntityList == other.tableServiceEntityList);

  @override
  int get hashCode =>
      tableServiceStatus.hashCode ^
      failure.hashCode ^
      tableServiceEntityList.hashCode;

  @override
  String toString() {
    return 'TableServiceState{' +
        ' tableServiceStatus: $tableServiceStatus,' +
        ' failure: $failure,' +
        ' tableServiceEntityList: $tableServiceEntityList,' +
        '}';
  }

  TableServiceState copyWith({
    TableServiceStatus? tableServiceStatus,
    Failure? failure,
    List<TableServiceEntity>? tableServiceEntityList,
  }) {
    return TableServiceState(
      tableServiceStatus: tableServiceStatus ?? this.tableServiceStatus,
      failure: failure ?? this.failure,
      tableServiceEntityList:
          tableServiceEntityList ?? this.tableServiceEntityList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tableServiceStatus': this.tableServiceStatus,
      'failure': this.failure,
      'tableServiceEntityList': this.tableServiceEntityList,
    };
  }

  factory TableServiceState.fromMap(Map<String, dynamic> map) {
    return TableServiceState(
      tableServiceStatus: map['tableServiceStatus'] as TableServiceStatus,
      failure: map['failure'] as Failure,
      tableServiceEntityList:
          map['tableServiceEntityList'] as List<TableServiceEntity>,
    );
  }

//</editor-fold>
}
