import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab2_mis/main.dart';
import 'package:lab2_mis/screens/login_page.dart';

class AuthService {

  Future<String?> register(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const LoginPage()),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }


  Future<String?> login(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(builder: (_) => MyHomePage()),
        );
      });
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return 'Invalid login credentials.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }


  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }


  Future<String?> getEmail() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user.email;
      } else {
        return 'No user is logged in.';
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}































