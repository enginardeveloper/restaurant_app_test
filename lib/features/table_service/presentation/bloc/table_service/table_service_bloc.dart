import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/database_dao/table_service_dao.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../entities/table_service/table_service_entity.dart';
import '../../../../../services/app_service/app_service.dart';
import '../../../../../services/cache_client_service/cache_client_service.dart';
import '../../../../../services/database_service/database_service.dart';

part 'table_service_event.dart';

part 'table_service_state.dart';

class TableServiceBloc extends Bloc<TableServiceEvent, TableServiceState> {
  final DatabaseService _databaseService;

  static const channelName = 'image_transfer_channel';
  static const methodName = 'getDataFromNative';

  TableServiceBloc({
    required DatabaseService databaseService,
  })
      : _databaseService = databaseService,
        super(
        const TableServiceState(),
      ) {
    on<TableServiceEventFetched>(_onTableServiceEventFetched);
  }

  _onTableServiceEventFetched(TableServiceEventFetched event,
      Emitter<TableServiceState> emit) async {

    emit(
      state.copyWith(
        tableServiceStatus: TableServiceStatus.loading,
      ),
    );

    Database db = await _databaseService.database;
    TableServiceDAO tableServiceDAO = TableServiceDAO(db);
    List<TableServiceEntity> tableServiceEntityList =  await tableServiceDAO.getAllList();
    tableServiceEntityList.forEach((value) => print(value.name));
    tableServiceEntityList.forEach((value) => print(value.status));

    emit(
      state.copyWith(
        tableServiceEntityList: tableServiceEntityList,
        tableServiceStatus: TableServiceStatus.success,
      ),
    );
  }
}
