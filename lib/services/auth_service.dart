import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> cadastrar({
    required String email,
    required String senha,
  })async {
    return await _auth.createUserWithEmailAndPassword(
    email: email, 
    password: senha,
    );
  }

  Future<UserCredential> entrar({
    required String email,
    required String senha,
  }) async {
    return await _auth.signInWithEmailAndPassword(email: 
    email, 
    password: senha,
    );
  }
}