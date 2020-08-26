import 'package:smart_money/app/shared/database/services/database_service.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/services/entries_service_interface.dart';

class EntriesService implements IEntriesService {
  final DatabaseService _databaseService;

  EntriesService(this._databaseService);

  @override
  Future<double> getAmount() async {
    double amount = 0.0;
    var entriesDao = await _databaseService.accessEntriesTable();
    List<EntriesModel> entriesList = await entriesDao.getAllEntries();
    for(var entry in entriesList) {
      amount += entry.amount;
    }

    return amount;
  }

  Future<CategoriesModel> getCategoryId(int id) async {
    var entriesDao = await _databaseService.accessEntriesTable();
    CategoriesModel category = await entriesDao.getCategoryId(id);
    return category;
  }
  
}