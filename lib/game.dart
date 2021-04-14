import 'dart:math';

import 'package:flutter/material.dart';

class game extends StatefulWidget {
  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  Widget _appImage = Image(image: AssetImage('images/padrao.png'), width: 125);
  var _resultado = 'Pedra, papel ou tesoura?';
  var _costumText = TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20
  );
   _computerPlay(choice){
    switch(choice) {
      case 0 :{
        setState(() {
          _appImage = Image(image: AssetImage('images/pedra.png'), width: 125);
        });
      } break;
      case 1 :{
        setState(() {
          _appImage = Image(image: AssetImage('images/papel.png'), width: 125);
        });
      } break;
      case 2 :{
        setState(() {
          _appImage = Image(image: AssetImage('images/tesoura.png'), width: 125);
        });
      } break;
    }
  }
  void _setTap(choice) {
    int _computerChoice = Random().nextInt(3);
    _computerPlay(_computerChoice);
    if(choice == 'pedra'){
      if(_computerChoice == 0){
        setState(() {
          _resultado = 'Temos um empate :|';
        });
      } else if(_computerChoice == 2){
        setState(() {
          _resultado = 'PARABÉNS, você ganhou! :D';
        });
      } else if(_computerChoice == 1) {
        setState(() {
          _resultado = 'Infelizmente você perdeu :c';
        });
      }
    } else if(choice == 'papel'){
      if(_computerChoice == 1){
        setState(() {
          _resultado = 'Temos um empate :|';
        });
      } else if(_computerChoice == 0){
        setState(() {
          _resultado = 'PARABÉNS, você ganhou! :D';
        });
      } else if(_computerChoice == 2) {
        setState(() {
          _resultado = 'Infelizmente você perdeu :c';
        });
      }
    } else {
      if(_computerChoice == 2){
        setState(() {
          _resultado = 'Temos um empate :|';
        });
      } else if(_computerChoice == 1){
        setState(() {
          _resultado = 'PARABÉNS, você ganhou! :D';
        });
      } else if(_computerChoice == 0) {
        setState(() {
          _resultado = 'Infelizmente você perdeu :c';
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jo Ken Po'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:
      Center(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text('Escolha do App:',style: _costumText),
              ),
              Padding(padding: EdgeInsets.only(top: 15, bottom: 10),
                child: _appImage),
              Padding(padding: EdgeInsets.only(top : 15, bottom: 30),
                child: Text(_resultado, style: _costumText)),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () =>_setTap('pedra'),
                    child: Image(image: AssetImage('images/pedra.png'), width: 100)
                  ),
                  GestureDetector(
                    onTap: () =>_setTap('papel'),
                    child: Image(image: AssetImage('images/papel.png'), width: 100)
                  ),
                  GestureDetector(
                    onTap: () => _setTap('tesoura'),
                    child: Image(image: AssetImage('images/tesoura.png'), width: 100)
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}