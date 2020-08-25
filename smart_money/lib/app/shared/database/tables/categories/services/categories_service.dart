import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_money/app/shared/database/services/database_service.dart';
import 'package:smart_money/app/shared/database/tables/categories/models/categories_model.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

class CategoriesService extends Disposable implements ICategoriesService {
 
  IDatabaseService _databaseService = Modular.get();
  
  @override
  void dispose() {
  }

  Future<void> initCategories() async {
    var categoriesDao = await _databaseService.accessCategoriesTable();
    await initColumnsDatabase();
    var response = await categoriesDao.getAll();
    print(response);
  }

  Future<void> initColumnsDatabase() async {
    var categoriesDao = await _databaseService.accessCategoriesTable();
    var exists = await categoriesDao.getAll();

    List<CategoriesModel> categoriesModelList = [];

    if(exists.length == 0) {
      CategoriesModel dividasEmprestimos = CategoriesModel(name: 'Dívidas e Empréstimos', color: '#1abc9c', isDebit: 1);
      categoriesModelList.add(dividasEmprestimos);
      CategoriesModel restauranteBares = CategoriesModel(name: 'Restaurantes e Bares', color: '#2ecc71', isDebit: 1);
      categoriesModelList.add(restauranteBares);
      CategoriesModel investimentos = CategoriesModel(name: 'Investimentos', color: '#3498db', isDebit: 1);
      categoriesModelList.add(investimentos);
      CategoriesModel alimentacao = CategoriesModel(name: 'Alimentação', color: '#9b59b6', isDebit: 1);
      categoriesModelList.add(alimentacao);
      CategoriesModel educacao = CategoriesModel(name: 'Educação', color: '#f39c12', isDebit: 1);
      categoriesModelList.add(educacao);
      CategoriesModel passagem = CategoriesModel(name: 'Passagem', color: '#f1c40f', isDebit: 1);
      categoriesModelList.add(passagem);
      CategoriesModel compras = CategoriesModel(name: 'Compras', color: '#e67e22', isDebit: 1);
      categoriesModelList.add(compras);
      CategoriesModel familia = CategoriesModel(name: 'Família', color: '#d35400', isDebit: 1);
      categoriesModelList.add(familia);
      CategoriesModel mercado = CategoriesModel(name: 'Mercado', color: '#c0392b', isDebit: 1);
      categoriesModelList.add(mercado);
      CategoriesModel outros = CategoriesModel(name: 'Outros', color: '#ecf0f1', isDebit: 1);
      categoriesModelList.add(outros);
      CategoriesModel lazer = CategoriesModel(name: 'Lazer', color: '#bdc3c7', isDebit: 1);
      categoriesModelList.add(lazer);
      CategoriesModel casa = CategoriesModel(name: 'Casa', color: '#95a5a6', isDebit: 1);
      categoriesModelList.add(casa);
      CategoriesModel investimentosGanhos = CategoriesModel(name: 'Investimentos', color: '#273c75', isCredit: 1);
      categoriesModelList.add(investimentosGanhos);
      CategoriesModel emprestimos = CategoriesModel(name: 'Empréstimos', color: '#4cd137', isCredit: 1);
      categoriesModelList.add(emprestimos);
      CategoriesModel salario = CategoriesModel(name: 'Salário', color: '#487eb0', isCredit: 1);
      categoriesModelList.add(salario);
      CategoriesModel outrosGanhos = CategoriesModel(name: 'Outros', color: '#8c7ae6', isCredit: 1);
      categoriesModelList.add(outrosGanhos);
    
      categoriesDao.insertCategoryList(categoriesModelList);
    }

    EntriesModel entriesModel = EntriesModel(amount: 1000);
    var entriesDao = await _databaseService.accessEntriesTable();
    entriesDao.insertEntry(entriesModel);
    print(await entriesDao.getAllEntries());
  }

}

abstract class ICategoriesService {

}