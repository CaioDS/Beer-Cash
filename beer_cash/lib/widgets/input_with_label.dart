import 'package:flutter/material.dart';

class InputWithLabel extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType type;
  final String field;

  InputWithLabel({ Key key, @required this.field, @required this.controller, @required this.type = TextInputType.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      keyboardType: this.type,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: this.field,
        contentPadding: EdgeInsets.only(bottom: 40, left: 30),
        labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.circular(25.7),
        ),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20),
          borderSide: BorderSide(),
        ),
      ),
      validator: (value) {
        if(value.isEmpty){
          return 'Campo Obrigatório';
        }
      }
    );
  }
}