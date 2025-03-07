import 'package:flutter/material.dart';
import 'package:nutriflow_app/services/firebase_service_intolerancias.dart';

class AgregarIntoleranciaScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final IntoleranciasService _service = IntoleranciasService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Intolerancia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nombre de la Intolerancia'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  await _service.agregarIntolerancia(_controller.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}