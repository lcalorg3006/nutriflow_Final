import 'package:cloud_firestore/cloud_firestore.dart';

class Intolerancia {
  final String id;
  final String nombre;

  Intolerancia({required this.id, required this.nombre});

  factory Intolerancia.fromFirebase(DocumentSnapshot doc) {
    return Intolerancia(
      id: doc.id,
      nombre: doc['Nombre'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Nombre': nombre,
    };
  }
}
