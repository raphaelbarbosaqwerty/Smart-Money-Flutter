import 'package:smart_money/app/shared/databases/general_database.dart';

abstract class ILaunchService {
  Future<void> deleteData(int id);
  Future<void> insertData(Entrie entry);
  Future<void> updateData(Entrie entry);
  Future<List<Categorie>> getDebit();
  Future<List<Categorie>> getCredit();
  Future<List<Categorie>> getListCategories();
}