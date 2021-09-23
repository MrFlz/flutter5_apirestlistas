
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Persona> _personas = [
    Persona("Jose","Cuevas","+52 1 958437142"),
    Persona("Alan","Emilio","+52 1 998437142"),
    Persona("Daniels","Flores","+52 1 998537142"),
    Persona("Victor","Manuel","+52 1 958437142"),
    Persona("Miguel","Angel","+52 1 998437142"),
    Persona("Luz","Noceda","+52 1 998537142"),
     Persona("Juan","Pablo","+52 1 998437142"),
    Persona("Hector","Ojeda","+52 1 998537142"),
    Persona("Ivonne","Arias","+52 1 958437142"),
    Persona("Larissa","Abigail","+52 1 998437142"),
    Persona("Amity","Blight","+52 1 998537142")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista App',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('API REST Listas'),
        ),

        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index){
            return ListTile(
              /* onTap: (){
                print(_personas[index].name);
              }, */
              onLongPress: (){
                //print(_personas[index].name);
                _borrarPersona(context, _personas[index]);
              },

              title: Text(_personas[index].name + ' ' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0,2))
              ),
              trailing: const Icon(Icons.arrow_forward_ios)
            );
          }
        )
      )
    );
  }

  _borrarPersona(context, Persona persona){
    showDialog(
      context: context, 
      builder: ( _ ) => AlertDialog(
        title: const Text("Eliminar contacto"),
        content: Text("¿Desea eliminar a " + persona.name + "?"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancelar")
          ),

          TextButton(
            onPressed: (){
              Navigator.pop(context);
              print(persona.name);
              setState(() {
                _personas.remove(persona);
              });
            },
            child: const Text("Borrar",
              style: TextStyle(
                color: Colors.red
              )
            )
          )
        ] // actions
      )
    ); // show dialog
  } // _borrarPersona 

}

class Persona {
  String name="";
  String lastname="";
  String phone="";

  Persona (this.name, this.lastname, this.phone);

}
