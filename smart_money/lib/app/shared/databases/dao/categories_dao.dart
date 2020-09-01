import 'package:moor/moor.dart';

import '../general_database.dart';

part 'categories_dao.g.dart';

class EntryWithCategory {

}

@UseDao(tables: [Entries, Categories])
class CategorieDao extends DatabaseAccessor<GeneralDatabase> with _$CategorieDaoMixin {
  
  Stream<List<Categorie>> listAll() {
    return (select(categories)).watch();  
  }

  Future<List<Categorie>> getAllCategories() async {
    return (select(categories)).get();
  }

  Future insertCategory(Categorie entity) async {
    return into(categories).insert(entity);
  }

  Future updateEntry(Categorie entity) async {
    return into(categories).insert(entity);
  }

  Future removeEntry(Categorie entity) async {
    return into(categories).insert(entity);
  }

  Future<List<Categorie>> getDebit() async {
    return (select(categories)..where((table) => table.isDebit.equals(1))).get();
  }

  Future<List<Categorie>> getCredit() async {
    return (select(categories)..where((table) => table.isCredit.equals(1))).get();
  }

  Future<Categorie> getCategoryById(int id) async {
    return (select(categories)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  CategorieDao(GeneralDatabase db) : super(db);

}