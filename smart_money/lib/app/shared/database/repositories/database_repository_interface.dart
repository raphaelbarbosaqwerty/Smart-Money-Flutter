import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database.dart';
import 'package:smart_money/app/shared/database/tables/categories/dao/categories_dao.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';

class DatabaseRepository extends Disposable implements IDatabaseRepository {
  
  @override
  void dispose() {
  }

  @override
  Future<FlutterDatabase> accessDatabase() async {
    // TODO - Change the Database name don't forget this
    return await $FloorFlutterDatabase.inMemoryDatabaseBuilder().build();
  }

  @override
  Future<CategoriesDao> accessCategoriesTable() async {
    var database = await accessDatabase();
    return database.categoriesDao;
  }
}

abstract class IDatabaseRepository {
  Future<FlutterDatabase> accessDatabase();
  Future<CategoriesDao> accessCategoriesTable();
}