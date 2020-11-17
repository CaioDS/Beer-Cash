import 'package:beer_cash/screens/calcular.screen.dart';
import 'package:beer_cash/screens/historico.screen.dart';
import 'package:flutter/material.dart';
import 'widgets/input_with_label.dart';
import 'screens/resultado.dart';
import 'package:beer_cash/controller/contas.controller.dart';
import 'package:beer_cash/model/contas.model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'app_status.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ContasController>.value(value: ContasController(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() =>_HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Container(
                      width: 250,
                      color: Colors.white,
                      child: FlatButton(
                        child: Text("Nova Conta",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        //backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => CalcularPage())),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Container(
                      width: 250,
                      color: Colors.white,
                      child: FlatButton(
                        child: Text("Histórico de Contas",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        onPressed: () => Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => HistoricoPage())),
                        /*onPressed: () => Navigator.push(
                            context, MaterialPageRoute(builder: (context) => HistoricoPage())),*/
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}



