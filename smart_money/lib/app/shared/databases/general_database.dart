import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'dao/categories_dao.dart';
import 'dao/entries_dao.dart';
import 'general_database_interface.dart';

part 'general_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  RealColumn get amount => real()();
  TextColumn get description => text()();
  DateTimeColumn get entryAt => dateTime()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get address => text()();
  TextColumn get image => text()();
  IntColumn get isInit => integer()();
  
  IntColumn get category_id => integer()();
}

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  TextColumn get name => text()();
  TextColumn get color => text()();
  IntColumn get isDefault => integer().nullable()();
  IntColumn get isCredit => integer().nullable()();
  IntColumn get isDebit => integer().nullable()();
  
}
@UseMoor(
  tables: [Entries, Categories]
)
class GeneralDatabase extends _$GeneralDatabase implements IGeneralDatabase {

  @override
  EntrieDao entrieDao;
  
  @override
  CategorieDao categorieDao;

  GeneralDatabase() : super(_openConnection()) {
    entrieDao = EntrieDao(this);
    categorieDao = CategorieDao(this);
    populateDatabase();
  }

  Future<void> populateDatabase() async {
    var exists = await categorieDao.getAllCategories();

    var categoriesModelList = [
      Categorie(name: 'Dívidas e Empréstimos', color: '#1abc9c', isDebit: 1, isCredit: null, id: null, isDefault: null),
      Categorie(name: 'Restaurantes e Bares', color: '#2ecc71', isDebit: 1, isCredit: null, id: null, isDefault: null),
      Categorie(name: 'Investimentos', color: '#3498db', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Alimentação', color: '#9b59b6', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Educação', color: '#f39c12', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Passagem', color: '#f1c40f', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Família', color: '#d35400', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Compras', color: '#e67e22', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Mercado', color: '#c0392b', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Outros', color: '#ecf0f1', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Lazer', color: '#bdc3c7', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Casa', color: '#95a5a6', isDebit: 1, id: null, isCredit: null, isDefault: null),
      Categorie(name: 'Investimentos', color: '#273c75', isCredit: 1, id: null, isDebit: null, isDefault: null),
      Categorie(name: 'Empréstimos', color: '#4cd137', isCredit: 1, id: null, isDebit: null, isDefault: null),
      Categorie(name: 'Salário', color: '#487eb0', isCredit: 1, id: null, isDebit: null, isDefault: null),
      Categorie(name: 'Outros', color: '#8c7ae6', isCredit: 1, id: null, isDebit: null, isDefault: null),
    ];

    var existsSalary = await entrieDao.getAllEntries();


    if(exists.length == 0 && existsSalary.length == 0) {
      for(var category in categoriesModelList) {
        await categorieDao.insertCategory(category);
      }

      entrieDao.addEntry(
        Entrie(
          id: null, 
          amount: 8000.0, 
          description: 'Salário', 
          entryAt: DateTime.now(), 
          latitude: 0, 
          longitude: 0, 
          address: 'null', 
          image: 'null', 
          isInit: 1, 
          category_id: 15
        )
      );
    }
  }

  @override
  int get schemaVersion => 1;
}