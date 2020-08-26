// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeaderController on _HeaderControllerBase, Store {
  final _$entriesModelAtom = Atom(name: '_HeaderControllerBase.entriesModel');

  @override
  List<EntriesModel> get entriesModel {
    _$entriesModelAtom.reportRead();
    return super.entriesModel;
  }

  @override
  set entriesModel(List<EntriesModel> value) {
    _$entriesModelAtom.reportWrite(value, super.entriesModel, () {
      super.entriesModel = value;
    });
  }

  final _$valueAtom = Atom(name: '_HeaderControllerBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$getValueAsyncAction = AsyncAction('_HeaderControllerBase.getValue');

  @override
  Future<double> getValue() {
    return _$getValueAsyncAction.run(() => super.getValue());
  }

  final _$getEntriesAsyncAction =
      AsyncAction('_HeaderControllerBase.getEntries');

  @override
  Future<void> getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$_HeaderControllerBaseActionController =
      ActionController(name: '_HeaderControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_HeaderControllerBaseActionController.startAction(
        name: '_HeaderControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HeaderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entriesModel: ${entriesModel},
value: ${value}
    ''';
  }
}
