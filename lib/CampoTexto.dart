
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _txtNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo de texto"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30,left: 8,right: 8,),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Informa seu nome"
                  ),
                  maxLength: 20,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                  onChanged: ( String valor){
                    print("Evento onChange "+valor);
                  },

                  onSubmitted: (String valor){
                  print("Evento onSubmitted "+valor);
                 },
                  controller: _txtNome,
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    print(" Voce digitou ${_txtNome.text}");
                  },
                  child: Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
