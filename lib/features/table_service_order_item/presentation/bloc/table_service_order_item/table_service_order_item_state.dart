part of 'table_service_order_item_bloc.dart';

enum TableServiceOrderItemStatus { initial, loading, success, failure }

class TableServiceOrderItemState extends Equatable {
  final TableServiceOrderItemStatus tableServiceOrderItemStatus;
  final TableServiceEntity? tableServiceEntity;
  final bool isMainMenu;
  final int mealCategoryId;
  final Failure failure;
  final List<TableServiceOrderItemEntity> tableServiceOrderItemEntityList;
  final List<MealCategoryEntity> mealCategoryEntityList;
  final List<MealEntity> mealEntityList;


  @override
  List<Object?> get props => [tableServiceOrderItemStatus, isMainMenu, mealCategoryId, failure, tableServiceOrderItemEntityList, mealCategoryEntityList, mealEntityList];

//<editor-fold desc="Data Methods">
  const TableServiceOrderItemState({
    this.tableServiceOrderItemStatus = TableServiceOrderItemStatus.initial,
    this.failure = const Failure(),
    this.isMainMenu = true,
    this.mealCategoryId = 0,
    this.tableServiceOrderItemEntityList = const <TableServiceOrderItemEntity>[],
    this.mealCategoryEntityList = const <MealCategoryEntity>[],
    this.mealEntityList = const <MealEntity>[],
    this.tableServiceEntity,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableServiceOrderItemState &&
          runtimeType == other.runtimeType &&
          tableServiceOrderItemStatus == other.tableServiceOrderItemStatus &&
          tableServiceEntity == other.tableServiceEntity &&
          isMainMenu == other.isMainMenu &&
          mealCategoryId == other.mealCategoryId &&
          failure == other.failure &&
          tableServiceOrderItemEntityList ==
              other.tableServiceOrderItemEntityList &&
          mealCategoryEntityList == other.mealCategoryEntityList &&
          mealEntityList == other.mealEntityList);

  @override
  int get hashCode =>
      tableServiceOrderItemStatus.hashCode ^
      tableServiceEntity.hashCode ^
      isMainMenu.hashCode ^
      mealCategoryId.hashCode ^
      failure.hashCode ^
      tableServiceOrderItemEntityList.hashCode ^
      mealCategoryEntityList.hashCode ^
      mealEntityList.hashCode;

  @override
  String toString() {
    return 'TableServiceOrderItemState{' +
        ' tableServiceOrderItemStatus: $tableServiceOrderItemStatus,' +
        ' tableServiceEntity: $tableServiceEntity,' +
        ' isMainMenu: $isMainMenu,' +
        ' mealCategoryId: $mealCategoryId,' +
        ' failure: $failure,' +
        ' tableServiceOrderItemEntityList: $tableServiceOrderItemEntityList,' +
        ' mealCategoryEntityList: $mealCategoryEntityList,' +
        ' mealEntityList: $mealEntityList,' +
        '}';
  }

  TableServiceOrderItemState copyWith({
    TableServiceOrderItemStatus? tableServiceOrderItemStatus,
    TableServiceEntity? tableServiceEntity,
    bool? isMainMenu,
    int? mealCategoryId,
    Failure? failure,
    List<TableServiceOrderItemEntity>? tableServiceOrderItemEntityList,
    List<MealCategoryEntity>? mealCategoryEntityList,
    List<MealEntity>? mealEntityList,
  }) {
    return TableServiceOrderItemState(
      tableServiceOrderItemStatus:
          tableServiceOrderItemStatus ?? this.tableServiceOrderItemStatus,
      tableServiceEntity: tableServiceEntity ?? this.tableServiceEntity,
      isMainMenu: isMainMenu ?? this.isMainMenu,
      mealCategoryId: mealCategoryId ?? this.mealCategoryId,
      failure: failure ?? this.failure,
      tableServiceOrderItemEntityList: tableServiceOrderItemEntityList ??
          this.tableServiceOrderItemEntityList,
      mealCategoryEntityList:
          mealCategoryEntityList ?? this.mealCategoryEntityList,
      mealEntityList: mealEntityList ?? this.mealEntityList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tableServiceOrderItemStatus': this.tableServiceOrderItemStatus,
      'tableServiceEntity': this.tableServiceEntity,
      'isMainMenu': this.isMainMenu,
      'mealCategoryId': this.mealCategoryId,
      'failure': this.failure,
      'tableServiceOrderItemEntityList': this.tableServiceOrderItemEntityList,
      'mealCategoryEntityList': this.mealCategoryEntityList,
      'mealEntityList': this.mealEntityList,
    };
  }

  factory TableServiceOrderItemState.fromMap(Map<String, dynamic> map) {
    return TableServiceOrderItemState(
      tableServiceOrderItemStatus:
          map['tableServiceOrderItemStatus'] as TableServiceOrderItemStatus,
      tableServiceEntity: map['tableServiceEntity'] as TableServiceEntity,
      isMainMenu: map['isMainMenu'] as bool,
      mealCategoryId: map['mealCategoryId'] as int,
      failure: map['failure'] as Failure,
      tableServiceOrderItemEntityList: map['tableServiceOrderItemEntityList']
          as List<TableServiceOrderItemEntity>,
      mealCategoryEntityList:
          map['mealCategoryEntityList'] as List<MealCategoryEntity>,
      mealEntityList: map['mealEntityList'] as List<MealEntity>,
    );
  }

//</editor-fold>
}
