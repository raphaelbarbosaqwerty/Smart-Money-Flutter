import 'package:smart_money/app/shared/databases/general_database.dart';

abstract class ISplashService {
  Future<List<Entrie>> getEntries();
  Future<void> setInitialBalance(Entrie generic);
}