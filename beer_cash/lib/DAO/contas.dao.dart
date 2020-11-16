import 'package:beer_cash/model/contas.model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContasDAO {
  @Query('SELECT * FROM Conta ORDER BY data')
  Future<List<Conta>> getAll();
  
  @Query("SELECT * FROM Conta WHERE id = :id")
  Future<Conta> getContaById(int id);

  @insert
  Future<int> insertConta(Conta c);

  @update
  Future<int> updateConta(Conta c);

  @delete
  Future<int> deleteConta(Conta c);
}