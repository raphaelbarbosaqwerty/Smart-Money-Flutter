// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$entriesModelAtom = Atom(name: '_HomeControllerBase.entriesModel');

  @override
  List<dynamic> get entriesModel {
    _$entriesModelAtom.reportRead();
    return super.entriesModel;
  }

  @override
  set entriesModel(List<dynamic> value) {
    _$entriesModelAtom.reportWrite(value, super.entriesModel, () {
      super.entriesModel = value;
    });
  }

  final _$categoriesModelAtom =
      Atom(name: '_HomeControllerBase.categoriesModel');

  @override
  List<dynamic> get categoriesModel {
    _$categoriesModelAtom.reportRead();
    return super.categoriesModel;
  }

  @override
  set categoriesModel(List<dynamic> value) {
    _$categoriesModelAtom.reportWrite(value, super.categoriesModel, () {
      super.categoriesModel = value;
    });
  }

  final _$touchedIndexAtom = Atom(name: '_HomeControllerBase.touchedIndex');

  @override
  int get touchedIndex {
    _$touchedIndexAtom.reportRead();
    return super.touchedIndex;
  }

  @override
  set touchedIndex(int value) {
    _$touchedIndexAtom.reportWrite(value, super.touchedIndex, () {
      super.touchedIndex = value;
    });
  }

  final _$pieTouchResponseAtom =
      Atom(name: '_HomeControllerBase.pieTouchResponse');

  @override
  PieTouchResponse get pieTouchResponse {
    _$pieTouchResponseAtom.reportRead();
    return super.pieTouchResponse;
  }

  @override
  set pieTouchResponse(PieTouchResponse value) {
    _$pieTouchResponseAtom.reportWrite(value, super.pieTouchResponse, () {
      super.pieTouchResponse = value;
    });
  }

  @override
  ObservableStream<List<dynamic>> getAll() {
    final _$stream = super.getAll();
    return ObservableStream<List<dynamic>>(_$stream);
  }

  final _$updateWidgetAsyncAction =
      AsyncAction('_HomeControllerBase.updateWidget');

  @override
  Future updateWidget() {
    return _$updateWidgetAsyncAction.run(() => super.updateWidget());
  }

  final _$getEntriesAsyncAction = AsyncAction('_HomeControllerBase.getEntries');

  @override
  Future<List<dynamic>> getEntries() {
    return _$getEntriesAsyncAction.run(() => super.getEntries());
  }

  final _$getCategoriesColorAsyncAction =
      AsyncAction('_HomeControllerBase.getCategoriesColor');

  @override
  Future getCategoriesColor() {
    return _$getCategoriesColorAsyncAction
        .run(() => super.getCategoriesColor());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  String getColor(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getColor');
    try {
      return super.getColor(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTouchedIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeTouchedIndex');
    try {
      return super.changeTouchedIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePieTouchResponse(PieTouchResponse value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changePieTouchResponse');
    try {
      return super.changePieTouchResponse(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entriesModel: ${entriesModel},
categoriesModel: ${categoriesModel},
touchedIndex: ${touchedIndex},
pieTouchResponse: ${pieTouchResponse}
    ''';
  }
}
