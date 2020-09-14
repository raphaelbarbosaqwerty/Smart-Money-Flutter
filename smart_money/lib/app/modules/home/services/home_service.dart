import 'package:smart_money/app/modules/home/services/home_service_interface.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';

class HomeService implements IHomeService {

  IGeneralDatabase generalDatabase;
  
  HomeService({this.generalDatabase});

  @override
  Future<List<Categorie>> getCategories() async {
    return await generalDatabase.categorieDao.getAllCategories();
  }

  @override
  Future<List<Entrie>> getEntries() async {
    return await generalDatabase.entrieDao.getAllEntries();
  }

  @override
  Stream<List<Entrie>> getAllEntriesAsStream() {
    return generalDatabase.entrieDao.listAll();
  }

  @override
  Stream<List<dynamic>> getEntryWithCategory() {
    return generalDatabase.entrieDao.listProdutoWithCategoria();
  }
}