import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'entry_buttons_controller.g.dart';

@Injectable()
class EntryButtonsController = _EntryButtonsControllerBase
    with _$EntryButtonsController;

abstract class _EntryButtonsControllerBase with Store {

}
