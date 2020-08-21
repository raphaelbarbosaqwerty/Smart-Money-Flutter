import 'package:floor/floor.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';

@dao
abstract class CategoriesDao {
  @Query('SELECT * FROM categories ORDER BY name')
  Future<List<CategoriesModel>> getAll();

  @Query('SELECT * FROM categories WHERE isDebit = 1 ORDER BY name')
  Future<List<CategoriesModel>> getDebit();

  @Query('SELECT * FROM categories WHERE isCredit = 1 ORDER BY name')
  Future<List<CategoriesModel>> getCredit();

  @insert
  Future<void> insertCategory(CategoriesModel categoryModel);

  @insert
  Future<void> insertCategoryList(List<CategoriesModel> categoryModel);

}