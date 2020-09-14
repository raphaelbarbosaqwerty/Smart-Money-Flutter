// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calender_store_widget.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalenderStore on _CalenderStoreBase, Store {
  final _$dateTimeAtom = Atom(name: '_CalenderStoreBase.dateTime');

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  final _$_CalenderStoreBaseActionController =
      ActionController(name: '_CalenderStoreBase');

  @override
  dynamic changeDateTime(DateTime value) {
    final _$actionInfo = _$_CalenderStoreBaseActionController.startAction(
        name: '_CalenderStoreBase.changeDateTime');
    try {
      return super.changeDateTime(value);
    } finally {
      _$_CalenderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DateTime getDateTime() {
    final _$actionInfo = _$_CalenderStoreBaseActionController.startAction(
        name: '_CalenderStoreBase.getDateTime');
    try {
      return super.getDateTime();
    } finally {
      _$_CalenderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateTime: ${dateTime}
    ''';
  }
}
