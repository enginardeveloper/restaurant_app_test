import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/database_dao/meal_category_dao.dart';
import 'package:restaurant_app/database_dao/meal_dao.dart';
import 'package:restaurant_app/entities/meal_category/meal_category_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../database_dao/table_service_dao.dart';
import '../../../../../database_dao/table_service_order_item_category_dao.dart';
import '../../../../../entities/meal/meal_entity.dart';
import '../../../../../entities/table_service/table_service_entity.dart';
import '../../../../../entities/table_service_order_item/table_service_order_item_entity.dart';
import '../../../../../services/database_service/database_service.dart';

part 'table_service_order_item_event.dart';

part 'table_service_order_item_state.dart';

class TableServiceOrderItemBloc extends Bloc<TableServiceOrderItemEvent, TableServiceOrderItemState> {
  final DatabaseService _databaseService;

  TableServiceOrderItemBloc({
    required DatabaseService databaseService,
  })
      : _databaseService = databaseService,
        super(
        const TableServiceOrderItemState(),
      ) {
    on<TableServiceOrderItemEventFetched>(_onTableServiceOrderItemEventFetched);
    on<TableServiceOrderItemEventMenuChanged>(_onTableServiceOrderItemEventMenuChanged);
    on<TableServiceOrderItemEventMealAdded>(_onTableServiceOrderItemEventMealAdded);
  }

  _onTableServiceOrderItemEventFetched(TableServiceOrderItemEventFetched event,
      Emitter<TableServiceOrderItemState> emit) async {
    emit(
      state.copyWith(
        tableServiceEntity: event.tableServiceEntity,
        tableServiceOrderItemStatus: TableServiceOrderItemStatus.loading,
      ),
    );

    Database db = await _databaseService.database;
    TableServiceOrderItemDAO tableServiceOrderItemDAO = TableServiceOrderItemDAO(db);
    List<TableServiceOrderItemEntity> tableServiceOrderItemEntityList =  await tableServiceOrderItemDAO.getByTableServiceId(event.tableServiceEntity.id);
    tableServiceOrderItemEntityList.forEach((value) => print(value.priceSum));

    MealCategoryDAO mealCategoryDAO = MealCategoryDAO(db);
    List<MealCategoryEntity> mealCategoryEntityList =  await mealCategoryDAO.getAllList();
    mealCategoryEntityList.forEach((value) => print(value.name));


    emit(
      state.copyWith(
        mealCategoryEntityList: mealCategoryEntityList,
        tableServiceOrderItemEntityList: tableServiceOrderItemEntityList,
        tableServiceOrderItemStatus: TableServiceOrderItemStatus.success,
      ),
    );
  }


  _onTableServiceOrderItemEventMenuChanged(TableServiceOrderItemEventMenuChanged event,
      Emitter<TableServiceOrderItemState> emit) async {


    if (event.isMainMenu) {
      emit(
        state.copyWith(
          isMainMenu: true,
          mealCategoryId: 0,
        ),
      );
    } else {
    Database db = await _databaseService.database;
    MealDAO mealDAO = MealDAO(db);

    List<MealEntity> mealEntityList =  await mealDAO.getByMealCategoryId(event.mealCategoryId);
    mealEntityList.forEach((value) => print(value.price));

    emit(
      state.copyWith(
        mealEntityList: mealEntityList,
        isMainMenu: false,
      ),
    );

    }
  }


  _onTableServiceOrderItemEventMealAdded(TableServiceOrderItemEventMealAdded event,
      Emitter<TableServiceOrderItemState> emit) async {
    emit(
      state.copyWith(
        tableServiceOrderItemStatus: TableServiceOrderItemStatus.loading,
      ),
    );
    Database db = await _databaseService.database;
    TableServiceOrderItemDAO tableServiceOrderItemDAO = TableServiceOrderItemDAO(db);

    TableServiceOrderItemEntity tableServiceOrderItemEntity = await tableServiceOrderItemDAO.insert(
      TableServiceOrderItemEntity(
      mealCount: 1,
      mealId: event.mealEntity.id,
      mealName: event.mealEntity.name,
      priceSum: event.mealEntity.price,
      tableServiceId: state.tableServiceEntity!.id,
    ),);

    List<TableServiceOrderItemEntity> tableServiceOrderItemEntityList = state.tableServiceOrderItemEntityList;
    tableServiceOrderItemEntityList.add(tableServiceOrderItemEntity);

    TableServiceDAO tableServiceDAO = TableServiceDAO(db);
    TableServiceEntity tableServiceEntity = await tableServiceDAO.update(state.tableServiceEntity!.copyWith(status: 1));


    emit(
      state.copyWith(
        tableServiceEntity: tableServiceEntity,
        tableServiceOrderItemStatus: TableServiceOrderItemStatus.success,
        tableServiceOrderItemEntityList: tableServiceOrderItemEntityList,
      ),
    );

    print("=aadddd kon inja tamoome kar");

  }



}
