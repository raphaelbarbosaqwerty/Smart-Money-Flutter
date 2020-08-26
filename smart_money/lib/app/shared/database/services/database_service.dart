import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database.dart';
import 'package:smart_money/app/shared/database/services/database_service_interface.dart';
import 'package:smart_money/app/shared/database/tables/categories/dao/categories_dao.dart';
import 'package:smart_money/app/shared/database/tables/entries/dao/entries_dao.dart';

class DatabaseService extends Disposable implements IDatabaseService {
 
  @override
  void dispose() {
  }

  @override
  Future<FlutterDatabase> accessDatabase() async {
    return await $FloorFlutterDatabase.inMemoryDatabaseBuilder().build();
  }

  @override
  Future<CategoriesDao> accessCategoriesTable() async {
    var database = await accessDatabase();
    return database.categoriesDao;
  }

  @override
  Future<EntriesDao> accessEntriesTable() async {
    var database = await accessDatabase();
    return database.entriesDao;
  }
}
