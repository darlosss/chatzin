import 'package:chat/functions/functions.dart';
import 'package:chat/telachat/telaChat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return App(Functions().enviarMensagem);
  }
}
