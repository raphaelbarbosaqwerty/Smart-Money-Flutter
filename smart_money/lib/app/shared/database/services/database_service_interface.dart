import 'package:smart_money/app/shared/database/services/database.dart';
import 'package:smart_money/app/shared/database/tables/categories/dao/categories_dao.dart';
import 'package:smart_money/app/shared/database/tables/entries/dao/entries_dao.dart';

abstract class IDatabaseService {
  Future<FlutterDatabase> accessDatabase();
  Future<CategoriesDao> accessCategoriesTable();
  Future<EntriesDao> accessEntriesTable();
}