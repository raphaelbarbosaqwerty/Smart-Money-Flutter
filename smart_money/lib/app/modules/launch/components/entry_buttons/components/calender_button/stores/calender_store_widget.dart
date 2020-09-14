import 'package:mobx/mobx.dart';
part 'calender_store_widget.g.dart';

class CalenderStore = _CalenderStoreBase with _$CalenderStore;

abstract class _CalenderStoreBase with Store {
  
  _CalenderStoreBase();

  @observable
  DateTime dateTime = DateTime.now();

  @action
  changeDateTime(DateTime value) => dateTime = value;

  @action
  DateTime getDateTime() => dateTime;
}