import 'package:smart_money/app/shared/databases/general_database.dart';

abstract class IHomeService {
  Future<List<Entrie>> getEntries();
  Future<List<Categorie>> getCategories();
  Stream<List<Entrie>> getAllEntriesAsStream();
  Stream<List<dynamic>> getEntryWithCategory();
}