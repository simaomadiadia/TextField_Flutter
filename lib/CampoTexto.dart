
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _txtNome = TextEditingController();

  bool selectedGuarda= false;
  String? _grupoGenero;
  bool receberNotificacoes = false;




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
              Padding(
                padding: EdgeInsets.only(top: 8,bottom: 6),

                child: Text(
                    "Provincias onde deseja frequentar o curso."
                ),
              )
              ,
              CheckboxListTile(
                  value: selectedGuarda,
                  secondary: Icon(Icons.location_city),
                  onChanged: ( bool? valor){
                    setState(() {
                      selectedGuarda = valor!;
                      print("Valor selecionado $selectedGuarda");
                    });
                  },
                title:Text("Guarda"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8,bottom: 6),

                child: Text(
                    "Genero"
                ),
              )
              ,
              RadioGroup<String>(
                groupValue: _grupoGenero,
                onChanged: (String? value) {
                  setState(() {
                    _grupoGenero = value;
                  });
                  print("Selecionado: $_grupoGenero");
                },
                child: Column(
                  children: [
                    RadioListTile<String>(
                      value: "m",
                      secondary:  Icon(Icons.man),
                      title: const Text("Masculino"),
                    ),
                    RadioListTile<String>(
                      secondary:  Icon(Icons.woman),
                      value: "f",
                      title: const Text("Feminino"),
                    ),
                  ],
                ),
              ),
              SwitchListTile(
                  title: Text("Receber notificações "),
                  secondary: Icon(
                    Icons.notifications
                  ) ,
                  activeThumbColor: Colors.blue,
                  value: receberNotificacoes, 
                  onChanged: (bool valor){
                    setState(() {
                      receberNotificacoes = valor;
                    });
                  }
              )
              ,
              ElevatedButton(
                  onPressed: (){
                    print(" Voce digitou ${_txtNome.text}");
                    print("Receber notificacoes ? ${receberNotificacoes}");
                  },
                  child: Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
