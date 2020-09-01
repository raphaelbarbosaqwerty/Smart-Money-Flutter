import 'dao/categories_dao.dart';
import 'dao/entries_dao.dart';

abstract class IGeneralDatabase {
  EntrieDao entrieDao;
  CategorieDao categorieDao;
}