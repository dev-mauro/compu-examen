import 'package:compu_examen/auth/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthProvider extends ChangeNotifier {

  AuthStatus authStatus = AuthStatus.unauthenticated;
  AppUser? appUser;


  AuthProvider() {
    // Listener que notificará a los widgets cuando cambie el estado de la sesión
    FirebaseAuth.instance
      .authStateChanges()
      .listen(( User? user ) {
        if (user == null) {
          user = null;
          authStatus = AuthStatus.unauthenticated;
        } else {
          appUser = AppUser(
            email: user.email ?? '',
            username: user.displayName ?? '',
            imageUrl: user.photoURL ?? '',
            uid: user.uid
          );
        }

        notifyListeners();
      });

  }

    // Permite iniciar sesión con email + password
  Future<void> loginWithCredentials( emailAddress, password ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = credential.user;
      appUser = AppUser(
        email: emailAddress,
        username: user!.displayName ?? '',
        imageUrl: user.photoURL ?? '',
        uid: user.uid
      );
      authStatus = AuthStatus.authenticated;

    } catch (e) {
      print(e);
    }
  }


  // Permite registrar un nuevo usuario con email + password + username
  Future<void> signUpWithCredentials( String emailAddress, String password, String username ) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      User? user = credential.user;

      if( user != null ) {
        await user.updateProfile(displayName: username);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        appUser = AppUser(
          email: emailAddress,
          username: username,
          imageUrl: user!.photoURL ?? '',
          uid: user.uid
        );
        authStatus = AuthStatus.authenticated;
      }

    } catch (e) {
      print(e);
    }
  }


  // Permite iniciar sesión con Google
  Future<void> loginWithGoogle() async {
    try {
      // Inicia el proceso de autenticación con Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential( credential );

      appUser = AppUser(
        email: user.user!.email ?? '',
        username: user.user!.displayName ?? '',
        imageUrl: user.user!.photoURL ?? '',
        uid: user.user!.uid
      );
      authStatus = AuthStatus.authenticated;

    } catch (e) {
      print(e);
    }
  }


  void logout() {
    FirebaseAuth.instance.signOut();
  }

  // Fake login para probar la app
  void fakeLogin() {
    authStatus = AuthStatus.authenticated;
    appUser = AppUser(
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