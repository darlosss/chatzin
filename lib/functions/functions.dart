import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Functions{
  enviarMensagem({String text, File img}) async{
    //adiciona na coleção mensagens num id aleatorio
    Firestore.instance.collection("mensagens").add({
      "text" : text
    });

    if(img != null){
      StorageUploadTask task = FirebaseStorage.instance.ref().child(
        DateTime.now().microsecondsSinceEpoch.toString()
      ).putFile(img);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();

    }
  }
}