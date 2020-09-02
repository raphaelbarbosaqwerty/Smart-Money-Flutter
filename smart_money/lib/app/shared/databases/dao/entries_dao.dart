import 'package:moor/moor.dart';

import '../general_database.dart';

part 'entries_dao.g.dart';

class EntryWithCategory {
  final Entrie entrie;
  final String nameCategorie;
  final String colorCategorie;

  EntryWithCategory(this.entrie, this.nameCategorie, this.colorCategorie);
}

class EntryAmount {
  final int amount;

  EntryAmount(this.amount);

}

@UseDao(tables: [Entries, Categories])
class EntrieDao extends DatabaseAccessor<GeneralDatabase> with _$EntrieDaoMixin {
  
  Stream<List<EntryWithCategory>> listProdutoWithCategoria() {
    return customSelect(
      "SELECT entries.*, categories.name, categories.color FROM entries INNER JOIN categories ON entries.category_id = categories.id",
      readsFrom: {entries, categories}).watch().map((rows) {
        return rows.map((row) => EntryWithCategory(Entrie.fromData(row.data, db), row.readString('name'), row.readString('color'))).toList();
      });
  }

  Stream<List<Entrie>> listAll() {
    return (select(entries)).watch();  
  }

  Stream<List<EntryAmount>> sumTestingAll() {
    return customSelect(
      "SELECT SUM(id) FROM entries", readsFrom: {entries}).watch().map((rows) {
        return rows.map((row) => EntryAmount(row.readInt('amount'))).toList();
      });
  }

  Future<List<Entrie>> getAllEntries() async {
    return (select(entries)).get();
  }

  Future<double> sumBalance() async {
    var value = 0.0;

    var allEntries = await getAllEntries();
    
    for(var entry in allEntries) {
      value += entry.amount;
    }

    return value;
  }

  Future addEntry(Entrie entity) async {
    return into(entries).insert(entity);
  }

  Future updateEntry(Entrie entity) async {
    return update(entries).replace(entity);
  }

  Future removeEntry(int id) async {
    return (delete(entries)..where((tbl) => tbl.id.equals(id))).go();
  }
  
  EntrieDao(GeneralDatabase db) : super(db);

}