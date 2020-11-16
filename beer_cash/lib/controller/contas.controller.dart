import 'package:mobx/mobx.dart';
import 'package:beer_cash/repositories/contas.repository.dart';
import 'package:beer_cash/model/contas.model.dart';

import '../app_status.dart';
part 'contas.controller.g.dart';

class ContasController = _ContasController with _$ContasController;

abstract class _ContasController with Store {
  ContaRepository repository;

  _ContasController() {
    _init();
  }

  Future<void> _init() async {
    repository = await ContaRepository.getInstance();
    await getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Conta> list = ObservableList<Conta>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      if(repository != null) {
        final allList = await repository.getAll();
        list.clear();
        list.addAll(allList);
      }
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<Conta> create(Conta c) async {
    status = AppStatus.loading;
    try {
      await repository.create(c);
      await getAll();
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error;
    }
  }

  @action
  Future<Conta> update(Conta c) async {
    status = AppStatus.loading;
    try {
      await repository.update(c);
      await getAll();
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error;
    }
  }

  @action
  Future<Conta> delete(int id) async {
    status = AppStatus.loading;
    try {
      await repository.delete(id);
      await getAll();
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error;
    }
  }


}