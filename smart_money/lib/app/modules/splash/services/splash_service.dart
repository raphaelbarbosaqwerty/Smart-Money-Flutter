import 'package:smart_money/app/modules/splash/services/splash_service_interface.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';
import 'package:smart_money/app/shared/databases/general_database_interface.dart';

class SplashService implements ISplashService {

  IGeneralDatabase generalDatabase;
  
  SplashService({this.generalDatabase});

  @override
  Future<List<Entrie>> getEntries() async {
    return await generalDatabase.entrieDao.getAllEntries();
  }

  @override
  Future<void> setInitialBalance(Entrie generic) async {
    await generalDatabase.entrieDao.addEntry(generic);
  }
  
}