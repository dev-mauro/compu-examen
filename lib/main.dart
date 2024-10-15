import 'package:compu_examen/auth/provider/auth_provider.dart';
import 'package:compu_examen/config/router/app_router.dart';
import 'package:compu_examen/config/theme/app_theme.dart';
import 'package:compu_examen/presentation/providers/app_provider_provider.dart';
import 'package:compu_examen/presentation/providers/category_provider.dart';
import 'package:compu_examen/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppProviderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routes: appRoutes,
        initialRoute: '/check-auth', 
      ),
    );
  }
}