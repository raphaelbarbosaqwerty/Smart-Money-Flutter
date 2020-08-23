import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/repositories/database_repository_interface.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

class EntriesService implements IEntriesService {
  IDatabaseRepository _databaseRepository = Modular.get();

  @override
  Future<double> getAmount() async {
    double amount = 0.0;
    var entriesDao = await _databaseRepository.accessEntriesTable();
    List<EntriesModel> entriesList = await entriesDao.getAllEntries();
    for(var entry in entriesList) {
      amount += entry.amount;
    }

    return amount;
  }
  
}

abstract class IEntriesService {
  Future<double> getAmount();
}