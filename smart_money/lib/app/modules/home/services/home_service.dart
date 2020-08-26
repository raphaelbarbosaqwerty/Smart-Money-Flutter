import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database_service_interface.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

class HomeService extends Disposable implements IHomeService {
  
  final IDatabaseService _databaseService;
  List<EntriesModel> entriesList;

  HomeService(this._databaseService);

  @override
  void dispose() {
  }

  Future<double> getAmount() async {
    double amount = 0.0;
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesList = await entriesDao.getAllEntries();
    for(var entry in entriesList) {
      amount += entry.amount;
    }

    return amount;
  }

  Future<List<EntriesModel>> getEntries() async {
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesList = await entriesDao.getAllEntries();
    return entriesList;
  }

}

abstract class IHomeService {

}