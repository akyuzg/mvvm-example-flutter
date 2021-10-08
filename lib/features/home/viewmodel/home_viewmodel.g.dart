// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$advisorsAtom = Atom(name: '_HomeViewModelBase.advisors');

  @override
  List<AdvisorModel>? get advisors {
    _$advisorsAtom.reportRead();
    return super.advisors;
  }

  @override
  set advisors(List<AdvisorModel>? value) {
    _$advisorsAtom.reportWrite(value, super.advisors, () {
      super.advisors = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getListAllAsyncAction = AsyncAction('_HomeViewModelBase.getListAll');

  @override
  Future<void> getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
advisors: ${advisors},
isLoading: ${isLoading}
    ''';
  }
}
