

import 'package:beer_cash/controller/contas.controller.dart';
import 'package:beer_cash/model/contas.model.dart';
import 'package:beer_cash/screens/resultado.dart';
import 'package:beer_cash/widgets/input_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../app_status.dart';

class CalcularPage extends StatefulWidget {
  @override
  _CalcularPageState createState() =>_CalcularPageState();
}

class _CalcularPageState extends State<CalcularPage> {

  //Variaveis
  final _tPessoas = TextEditingController();
  final _tTotal = TextEditingController();
  final _tPorcentagem = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  ContasController _controller = null;

  @override
  Widget build(BuildContext context) {

    _controller = Provider.of<ContasController>(context);

    return Scaffold(
      backgroundColor: Color(0xffffe159),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffe159),
        flexibleSpace: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Beer & Cash",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if(_controller.status == AppStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (_controller.status == AppStatus.success) {
          return _body();
        }
      },),
    );
  }

  _body() {
    return Padding(
      padding: EdgeInsets.only(
        top: 60.0, //150.0
      ),
      child: Center(
          child: Stack(
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Card(
                  elevation: 30,
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 70,
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: _inputWithLabel(_tTotal, TextInputType.number, "Valor Total"),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: _inputWithLabel(_tPessoas, TextInputType.number, "Quantidade de Pessoas"),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: _inputWithLabel(_tPorcentagem, TextInputType.number, "Porcentagem do Garçom (%)"),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 80),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: _button(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  _inputWithLabel(TextEditingController controller, TextInputType type, String field) {
    return InputWithLabel(controller: controller, type: type, field: field);
  }

  _button() {
    return Container(
      width: double.minPositive,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: FlatButton(
        color: Color(0xffe0c131),
        child: Text("CALCULAR"),
        textColor: Colors.black,
        onPressed: _calculate,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  void _calculate() {
    setState(() {
      double total = double.parse(_tTotal.text);
      double pessoas = double.parse(_tPessoas.text);
      double porcentagem = double.parse(_tPorcentagem.text);

      double valor_garcom = total*(porcentagem/100);
      double valor_pessoa = (total+valor_garcom) / pessoas;

      _controller.create(Conta(valor: total, data: DateTime.now().toString()));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScreenResultado(resultado: valor_pessoa, valor_porcentagem: valor_garcom, total: total,))
      );
    });
  }

}