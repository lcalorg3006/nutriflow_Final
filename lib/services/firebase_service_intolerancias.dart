import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriflow_app/entities/intolerancias.dart'; 

class IntoleranciasService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Intolerancia>> getIntolerancias() async {
    User? user = _auth.currentUser;
    if (user == null) {
      return [];
    }

    QuerySnapshot query = await _db.collection('intolerancias').get();
    List<Intolerancia> intolerancias = query.docs.map((DocumentSnapshot doc) {
      return Intolerancia.fromFirebase(doc);
    }).toList();

    return intolerancias;
  }

  Future<void> agregarIntolerancia(String nombre) async {
    await _db.collection('intolerancias').add({'Nombre': nombre});
  }

  Future<void> eliminarIntolerancia(String intoleranciaId) async {
    await _db.collection('intolerancias').doc(intoleranciaId).delete();
  }
}
