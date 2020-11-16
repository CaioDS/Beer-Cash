import 'package:beer_cash/model/contas.model.dart';
import 'package:beer_cash/DAO/contas.dao.dart';
import 'package:beer_cash/repositories/contas.database.dart';
import 'package:flutter/cupertino.dart';

class ContaRepository {
  static ContaRepository _instance;
  ContaRepository._();

  AppDatabase database;
  ContasDAO contasDAO;

  static Future<ContaRepository> getInstance() async {
    if(_instance != null)
      return _instance;
    _instance = ContaRepository._();
    await _instance.init();
    return _instance;
  }

  Future<void> init() async {
    database = await $FloorAppDatabase
        .databaseBuilder('contas.db')
        .build();
    contasDAO = database.contasDAO;
  }

  Future<List<Conta>> getAll() async {
    try {
      return await contasDAO.getAll();
    } catch (e) {
      return List<Conta>();
    }
  }

  Future<bool> create(Conta c) async {
    try {
      await contasDAO.insertConta(c);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(Conta c) async {
    try {
      await contasDAO.updateConta(c);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      Conta c = await contasDAO.getContaById(id);
      await contasDAO.deleteConta(c);
      return true;
    } catch (e) {
      return false;
    }
  }

}