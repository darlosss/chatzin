import 'package:flutter/material.dart';
import 'package:chat/globals/globals.dart' as globals;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class App extends StatefulWidget {
  Function({String text, File img}) enviarMensagem;
  App(this.enviarMensagem);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _controllerMensagem = TextEditingController();
  bool _digitado;
  void _reset()
  {
    _controllerMensagem.clear();
    setState(() {
      _digitado = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: globals.primaryColor,
            title: Text(
              "Chat",
              style: TextStyle(
                  color: globals.secundaryColor,
                  fontSize: globals.fontSizeTitle,
                  fontWeight: FontWeight.bold),
            )),
        body: corpoMensagem());
  }

  Widget corpoMensagem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(      
                  Icons.camera_alt,
                  color: globals.primaryColor,
                  size: 30,
                ),
                onPressed: () async{
                  final img =await ImagePicker().getImage(source: ImageSource.camera);
                  if(img == null) return;
                  File image = File(img.path);
                  widget.enviarMensagem(img: image);
                }),
            Expanded(
              child: TextField(
                controller: _controllerMensagem,
                style: TextStyle(fontSize: 23),
                decoration: InputDecoration.collapsed(
                  hintText: "Digite sua Mensagem",
                ),
                onChanged: (text){
                  setState(() {
                    _digitado = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){
                  widget.enviarMensagem(text: text);
                  _reset();
                },
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.send,
                  color:_digitado == true? globals.primaryColor : Colors.grey,
                  size: 30,
                ),
                onPressed: (){
                  widget.enviarMensagem(text: _controllerMensagem.text);
                  _reset();              
                },
                
            )
          ],
        ),
      ],
    );
  }
}
