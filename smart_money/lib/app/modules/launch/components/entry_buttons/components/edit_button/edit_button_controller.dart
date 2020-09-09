import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'edit_button_controller.g.dart';

@Injectable()
class EditButtonController = _EditButtonControllerBase
    with _$EditButtonController;

abstract class _EditButtonControllerBase with Store {
  @observable
  int value = 0;
}
