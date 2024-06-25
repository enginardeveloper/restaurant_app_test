import 'package:sqflite/sqflite.dart';
import '../../../database_dao/meal_category_dao.dart';
import '../../../database_dao/meal_dao.dart';
import '../../../database_dao/table_service_dao.dart';
import '../../../database_dao/table_service_order_item_category_dao.dart';
import '../../../entities/meal/meal_entity.dart';
import '../../../entities/meal_category/meal_category_entity.dart';
import '../../../entities/table_service/table_service_entity.dart';
import '../../../injector/injector.dart';
import '../../log_service/log_service.dart';
import '../database_service.dart';
import 'package:path/path.dart' as p;


class DatabaseServiceImpl implements DatabaseService {

  late final LogService _logService;
  //static final DatabaseServiceImpl _databaseServiceImpl = DatabaseServiceImpl._();

  static const _databaseLocalName = "restaurant.db";
  static const _databaseVersion = 1;

  Database? _database;

  DatabaseServiceImpl({
    required LogService logService,
  }) {
    _logService = logService;
    init();
  }

  @override
  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  @override
  init() async {
    _database ??= await initializeDatabase();

    Batch batch = _database!.batch();

    batch.execute(TableServiceDAO.dropTableQuery);
    batch.execute(TableServiceOrderItemDAO.dropTableQuery);
    batch.execute(MealDAO.dropTableQuery);
    batch.execute(MealCategoryDAO.dropTableQuery);

    await batch.commit();

    batch = _database!.batch();

    batch.execute(TableServiceDAO.createTableQuery);
    batch.execute(TableServiceOrderItemDAO.createTableQuery);
    batch.execute(MealDAO.createTableQuery);
    batch.execute(MealCategoryDAO.createTableQuery);

    await batch.commit();

    await Future.wait([
      _getTableServiceList(),
      _getMealCategoryList(),
      _getMealList(),
    ]);

    Injector.instance.signalReady(this);
  }



  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, _databaseLocalName);

    var database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await _onCreateDatabaseLocal(db, version);
      },
      onOpen: (db) async {
        await _onOpenDatabaseLocal(db);
      },
    );
    return database;
  }

  Future<void> _onOpenDatabaseLocal(Database db) async {
  }

  Future<void> _onCreateDatabaseLocal(Database db, int newVersion) async {

  }



  Future<void> _getTableServiceList() async {
    TableServiceDAO tableServiceDAO = TableServiceDAO(_database!);
      List<TableServiceEntity> tableServiceEntityList = [
        const TableServiceEntity(id: 1, name: 'T 1', status: 0),
        const TableServiceEntity(id: 2, name: 'T 2', status: 0),
        const TableServiceEntity(id: 3, name: 'T 3', status: 0),
        const TableServiceEntity(id: 4, name: 'T 4', status: 0),
        const TableServiceEntity(id: 5, name: 'T 5', status: 0),
        const TableServiceEntity(id: 6, name: 'T 6', status: 0),
      ];
      await tableServiceDAO.insertBatch(tableServiceEntityList);
  }

  Future<void> _getMealCategoryList() async {
    MealCategoryDAO mealCategoryDAO = MealCategoryDAO(_database!);
    List<MealCategoryEntity> mealCategoryEntityList = [
      const MealCategoryEntity(id: 1, name: 'BENTO BOX',),
      const MealCategoryEntity(id: 2, name: 'CHEESECAKE SERIES',),
    ];
    await mealCategoryDAO.insertBatch(mealCategoryEntityList);
  }

  Future<void> _getMealList() async {
    MealDAO mealDAO = MealDAO(_database!);
    List<MealEntity> mealEntityList = [
      const MealEntity(id: 1, mealCategoryId: 1, name: 'CHICKEN (GRILLED BENTO BOX)',  price: 17.0),
      const MealEntity(id: 2, mealCategoryId: 1, name: 'CHICKEN TEMPURA BENTO BOX',  price: 17.0),
      const MealEntity(id: 3, mealCategoryId: 1, name: 'FRIED TOFU BENTO BOX',  price: 15.0),
      const MealEntity(id: 4, mealCategoryId: 1, name: 'GRILLED TOFU BENTO BOX',  price: 15.0),
      const MealEntity(id: 5, mealCategoryId: 1, name: 'SALMON BENTO BOX',  price: 16.0),
      const MealEntity(id: 6, mealCategoryId: 1, name: 'SHRIMP GRILLED BENTO BOX',  price: 17.0),
      const MealEntity(id: 7, mealCategoryId: 1, name: 'SHRIMP TEMPURA BENTO BOX',  price: 17.0),
      const MealEntity(id: 8, mealCategoryId: 1, name: 'STEAK BENTO BOX',  price: 18.0),

      const MealEntity(id: 9, mealCategoryId: 2, name: 'MATCHA CHEESECAKE LARGE',  price: 7.45),
      const MealEntity(id: 10, mealCategoryId: 2, name: 'MILK TEA CHEESECAKE LARGE',  price: 7.45),
      const MealEntity(id: 11, mealCategoryId: 2, name: 'OREO CHEESECAKE',  price: 7.45),
      const MealEntity(id: 12, mealCategoryId: 2, name: 'RASPBERRY CHEESECAKE',  price: 7.45),
      const MealEntity(id: 13, mealCategoryId: 2, name: 'STRAWBERRY CHEESECAKE',  price: 7.45),
      const MealEntity(id: 14, mealCategoryId: 2, name: 'TARO CHEESECAKE LARGE',  price: 7.45),
    ];
    await mealDAO.insertBatch(mealEntityList);
  }

}