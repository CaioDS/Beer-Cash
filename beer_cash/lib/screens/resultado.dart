import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenResultado extends StatelessWidget {

  final double resultado;
  final double valor_porcentagem;
  final double total;

  ScreenResultado({ @required this.resultado, @required this.valor_porcentagem, @required this.total });

  @override
  Widget build(BuildContext context) {
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
                "Mestre dos Bares",
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
      body: Padding(
        padding: EdgeInsets.only(
          top: 60.0, //150.0
        ),
        child: Center(
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 30,
                  color: Color(0xffffe159),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 100,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 50),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Valor total: \n"+"RS "+total.toString(),
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 50),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Valor total + Serviços: \n"+"RS "+(total+valor_porcentagem).toString(),
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 50),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Valor por pessoa: \n"+"RS "+resultado.toString(),
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
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
              ],
            )
        ),
      ),
    );
  }
}