import 'package:flutter/material.dart';
import 'package:compu_examen/entities/app_provider_entity.dart';

class AppProviderProvider extends ChangeNotifier {

  List<AppProvider> providers = [];

  AppProvider? selectedProvider;

  AppProviderProvider() {
    fakeFetchAppProviders();
  }

  Future<void> fetchAppProviders() async {
    // TODO: Obtener los proveedores de la API
  }

  Future<void> addAppProvider({
    required String name,
    required String address,
    String? imageUrl,
  }) async {
    // TODO: Agregar un proveedor a la API
  }

  // Selecciona un proveedor para editarlo
  void selectProvider( AppProvider provider ) {
    selectedProvider = provider;
    notifyListeners();
  }


  void fakeFetchAppProviders() {
    providers = [
      AppProvider(
        id: 1,
        name: 'juan',
        lastName: 'gonzales',
        email: 'juan@mail.com',
      ),
      AppProvider(
        id: 2,
        name: 'maría',
        lastName: 'reyes',
        email: 'maria@mail.com',
      ),
    ];
  }

}