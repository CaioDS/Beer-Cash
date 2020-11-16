// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contas.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContasController on _ContasController, Store {
  final _$statusAtom = Atom(name: '_ContasController.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAtom = Atom(name: '_ContasController.list');

  @override
  ObservableList<Conta> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Conta> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_ContasController.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$createAsyncAction = AsyncAction('_ContasController.create');

  @override
  Future<Conta> create(Conta c) {
    return _$createAsyncAction.run(() => super.create(c));
  }

  final _$updateAsyncAction = AsyncAction('_ContasController.update');

  @override
  Future<Conta> update(Conta c) {
    return _$updateAsyncAction.run(() => super.update(c));
  }

  final _$deleteAsyncAction = AsyncAction('_ContasController.delete');

  @override
  Future<Conta> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
