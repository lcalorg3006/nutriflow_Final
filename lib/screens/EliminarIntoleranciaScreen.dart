import 'package:flutter/material.dart';
import 'package:nutriflow_app/services/firebase_service_intolerancias.dart';
import 'package:nutriflow_app/entities/intolerancias.dart';
class EliminarIntoleranciaScreen extends StatefulWidget {
  @override
  _EliminarIntoleranciaScreenState createState() => _EliminarIntoleranciaScreenState();
}

class _EliminarIntoleranciaScreenState extends State<EliminarIntoleranciaScreen> {
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
      appBar: AppBar(title: Text('Eliminar Intolerancia')),
      body: ListView.builder(
        itemCount: _intolerancias.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_intolerancias[index].nombre),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await _service.eliminarIntolerancia(_intolerancias[index].id);
                _loadIntolerancias();
              },
            ),
          );
        },
      ),
    );
  }
}
