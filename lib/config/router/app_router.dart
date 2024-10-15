import 'package:compu_examen/auth/screens/auth_screen.dart';
import 'package:compu_examen/auth/screens/check_auth.dart';
import 'package:compu_examen/presentation/screens/categories_screen.dart';
import 'package:compu_examen/presentation/screens/category_edit_screen.dart';
import 'package:compu_examen/presentation/screens/home_screen.dart';
import 'package:compu_examen/presentation/screens/product_edit_screen.dart';
import 'package:compu_examen/presentation/screens/products_screen.dart';
import 'package:compu_examen/presentation/screens/app_providers_screen.dart';
import 'package:compu_examen/presentation/screens/provider_edit_screen.dart';
import 'package:flutter/material.dart';

enum AppRoutes {
  home,
  auth,
  checkAuth,
  providers,
  categories,
  products,
  editProduct,
  editCategory,
  editProvider,
}

final Map<String, Widget Function( BuildContext )> appRoutes = {
  
  '/': (context) => const HomeScreen(),
  '/auth': (context) => const AuthScreen(),
  '/check-auth': (context) => const CheckAuth(),
  '/providers': (context) => const AppProvidersScreen(),
  '/categories': (context) => const CategoriesScreen(),
  '/products': (context) => const ProductsScreen(),
  '/edit-product': (context) => const ProductEditScreen(),
  '/edit-category': (context) => const CategoryEditScreen(),
  '/edit-provider': (context) => const ProviderEditScreen(),

};


// Route<dynamic> onGenerateRoute( RouteSettings ) {

// }

String getRoute( AppRoutes route ) {

  final Map<AppRoutes, String> routes = {
    AppRoutes.home: '/',
    AppRoutes.auth: '/auth',
    AppRoutes.checkAuth: '/check-auth',
    AppRoutes.providers: '/providers',
    AppRoutes.categories: '/categories',
    AppRoutes.products: '/products',
    AppRoutes.editProduct: '/edit-product',
    AppRoutes.editCategory: '/edit-category',
    AppRoutes.editProvider: '/edit-provider',
  };

  return routes[route]!;
} 

void navigateTo( BuildContext context, AppRoutes route ) {
  Navigator.pushNamed(context, getRoute(route));
}

// navega a una ruta y elimina las demas rutas
void navigateToAndRemove( BuildContext context, AppRoutes route ) {
  Navigator.pushNamedAndRemoveUntil(context, getRoute(route), (route) => false);
}