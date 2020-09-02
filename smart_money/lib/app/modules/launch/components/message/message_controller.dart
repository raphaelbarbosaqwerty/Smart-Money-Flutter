import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'message_controller.g.dart';

@Injectable()
class MessageController = _MessageControllerBase with _$MessageController;

abstract class _MessageControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
