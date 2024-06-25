part of 'table_service_order_item_bloc.dart';

abstract class TableServiceOrderItemEvent extends Equatable {
  const TableServiceOrderItemEvent();

  @override
  List<Object?> get props => [];
}

final class TableServiceOrderItemEventFetched extends TableServiceOrderItemEvent {
  final TableServiceEntity tableServiceEntity;
  const TableServiceOrderItemEventFetched({required this.tableServiceEntity});

  @override
  List<Object?> get props => [tableServiceEntity];
}

final class TableServiceOrderItemEventMenuChanged extends TableServiceOrderItemEvent {
  final bool isMainMenu;
  final int mealCategoryId;

  const TableServiceOrderItemEventMenuChanged({required this.isMainMenu,  required this.mealCategoryId});

  @override
  List<Object?> get props => [isMainMenu, mealCategoryId];
}


final class TableServiceOrderItemEventMealAdded extends TableServiceOrderItemEvent {
  final MealEntity mealEntity;


  const TableServiceOrderItemEventMealAdded({required this.mealEntity,});

  @override
  List<Object?> get props => [mealEntity,];
}
