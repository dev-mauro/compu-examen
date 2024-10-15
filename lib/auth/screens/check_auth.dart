import 'package:compu_examen/auth/provider/auth_provider.dart';
import 'package:compu_examen/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        navigateToAndRemove( context, AppRoutes.home );
      } else {
        navigateToAndRemove( context, AppRoutes.auth );
      }
    });
    
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}