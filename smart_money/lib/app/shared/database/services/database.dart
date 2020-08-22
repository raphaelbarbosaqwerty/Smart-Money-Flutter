import 'dart:async';

import 'package:floor/floor.dart';
import 'package:smart_money/app/shared/database/tables/categories/dao/categories_dao.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/dao/entries_dao.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities:[CategoriesModel, EntriesModel])
abstract class FlutterDatabase extends FloorDatabase {
  CategoriesDao get categoriesDao;
  EntriesDao get entriesDao;

}