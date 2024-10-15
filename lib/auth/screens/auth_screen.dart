import 'package:compu_examen/auth/screens/login_screen.dart';
import 'package:compu_examen/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {

    final pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Bienvenido!'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: 2,
        itemBuilder: (context, index) {
          return index == 0
            ? LoginScreen(goToRegister: () =>
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut
                )
              )
            : RegisterScreen(goToLogin: () => 
                pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut
                )
              );
        }
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  final String title;
  final PageController pageController;
  
  const LoginPage({
    super.key,
    required this.title,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        ElevatedButton(
          onPressed: () {
            if( pageController.page == 0 ) {
              pageController.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
            } else {
              pageController.animateToPage(0, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
            }
          },
          child: const Text('Ir a la otra página'),
        ),
      ]
    );
  }
}