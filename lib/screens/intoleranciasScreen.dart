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
      appBar: AppBar(
        title: Text('Intolerancias'),
        backgroundColor: Colors.green, 
      ),
      body: ListView.builder(
        itemCount: _intolerancias.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green[200], 
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _intolerancias[index].nombre,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
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
            backgroundColor: Colors.green,
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
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
