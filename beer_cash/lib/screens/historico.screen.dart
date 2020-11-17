

import 'package:beer_cash/controller/contas.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../app_status.dart';

class HistoricoPage extends StatefulWidget {
  @override
  _HistoricoListViewState createState() =>_HistoricoListViewState();
}

class _HistoricoListViewState extends State<HistoricoPage> {
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
        top: 10.0, //150.0
      ),
      child: Center(
          child: Stack(
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      child: ListView(
                        children: [
                          for(int i = 0; i < _controller.list.length; i++)
                            Container(
                              width: 200,
                              height: 100,
                              //height: 100,
                              child: Card(
                                elevation: 2,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  children: [
                                    Text('   '+(i+1).toString()+' - Valor: '+_controller.list[i].valor.toString(), style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ) ,
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
    );
  }
}