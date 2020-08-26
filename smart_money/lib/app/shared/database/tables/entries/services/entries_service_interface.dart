import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';

abstract class IEntriesService {
  Future<double> getAmount();
  Future<CategoriesModel> getCategoryId(int id);
}