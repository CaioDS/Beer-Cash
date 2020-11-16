import 'dart:async';
import 'package:beer_cash/model/contas.model.dart';
import 'package:beer_cash/DAO/contas.dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'conta.database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Conta])
abstract class AppDatabase extends FloorDatabase{
  ContasDAO get contasDAO;
}