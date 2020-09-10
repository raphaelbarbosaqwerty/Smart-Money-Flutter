import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';

import 'launch_service_interface.dart';

class LaunchService implements ILaunchService {

  IGeneralDatabase generalDatabase;

  LaunchService({this.generalDatabase});

  @override
  Future<void> deleteData(int id) async {
    await generalDatabase.entrieDao.removeEntry(id);
  }

  @override
  Future<void> insertData(Entrie object) async {
    if(object.id == null) {
      await generalDatabase.entrieDao.addEntry(object); 
    } else {
      await updateData(object);
    }
  }

  @override
  Future<void> updateData(Entrie entry) async {
    await generalDatabase.entrieDao.updateEntry(entry);
  }

  @override
  Future<List<Categorie>> getListCategories() async {
    return await generalDatabase.categorieDao.getAllCategories();
  }

  @override
  Future<List<Categorie>> getCredit() async {
    return await generalDatabase.categorieDao.getCredit();
  }

  @override
  Future<List<Categorie>> getDebit() async {
    return await generalDatabase.categorieDao.getDebit();
  }
}