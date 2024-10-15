import 'package:compu_examen/auth/entities/user_entity.dart';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {

  AuthStatus authStatus = AuthStatus.unauthenticated;
  User? user;


  void logout() {
    authStatus = AuthStatus.unauthenticated;
    user = null;
    
    notifyListeners();
  }

  // Fake login para probar la app
  void fakeLogin() {
    authStatus = AuthStatus.authenticated;
    user = User(
      uid: 'a1z9',
      email: 'example@mail.com',
      username: 'exampleacc',
    );

    notifyListeners();
  }

}

enum AuthStatus {
  unauthenticated,
  authenticated,
}