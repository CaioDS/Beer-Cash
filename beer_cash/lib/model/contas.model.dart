import 'package:floor/floor.dart';

@entity
class Conta {
  @PrimaryKey(autoGenerate: true)
  int id;
  String data;
  double valor;

  Conta ({this.id, this.data, this.valor});

  Conta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['valor'] = this.valor;
    return data;
  }
}