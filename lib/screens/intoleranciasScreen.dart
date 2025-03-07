import 'package:flutter/material.dart';
import 'package:nutriflow_app/services/firebase_service_intolerancias.dart';
import 'package:nutriflow_app/entities/intolerancias.dart';
import 'package:nutriflow_app/screens/AgregarIntoleranciaScreen.dart';
import 'package:nutriflow_app/screens/EliminarIntoleranciaScreen.dart'; 


class IntoleranciasScreen extends StatefulWidget {
  @override
  _IntoleranciasScreenState createState() => _IntoleranciasScreenState();
}

class _IntoleranciasScreenState extends State<IntoleranciasScreen> {
  final IntoleranciasService _service = IntoleranciasService();
  List<Intolerancia> _intolerancias = [];

  @override
  void initState() {
    super.initState();
    _loadIntolerancias();
  }

  Future<void> _loadIntolerancias() async {
    List<Intolerancia> intolerancias = await _service.getIntolerancias();
    setState(() {
      _intolerancias = intolerancias;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intolerancias')),
      body: ListView.builder(
        itemCount: _intolerancias.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_intolerancias[index].nombre),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AgregarIntoleranciaScreen()),
            ).then((_) => _loadIntolerancias()),
            child: Icon(Icons.add),
            tooltip: 'Agregar Intolerancia',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EliminarIntoleranciaScreen()),
            ).then((_) => _loadIntolerancias()),
            child: Icon(Icons.delete),
            tooltip: 'Eliminar Intolerancia',
          ),
        ],
      ),
    );
  }
}
