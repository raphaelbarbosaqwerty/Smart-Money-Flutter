import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_money/app/modules/splash/services/splash_service.dart';
import 'package:smart_money/app/shared/databases/general_database.dart';

part 'welcome_controller.g.dart';

@Injectable()
class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {

  SplashService splashService;

  _WelcomeControllerBase({this.splashService});

  @observable
  double amount = 0.0;

  @observable
  var moneyMask = MoneyMaskedTextController(leftSymbol: 'R\$');

  @action
  changeValue(double newValue) => amount = newValue;

  @action
  initialBalance() {
    
    var object = Entrie(
      id: null, 
      amount: amount, 
      description: 'Saldo Inicial', 
      entryAt: DateTime.now(), 
      latitude: 0.0, 
      longitude: 0.0, 
      address: '', 
      image: null, 
      isInit: 1, 
      category_id: 15
    );

    splashService.setInitialBalance(object);
  }
}
