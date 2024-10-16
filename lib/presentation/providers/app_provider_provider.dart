import 'package:compu_examen/helpers/api_service.dart';
import 'package:flutter/material.dart';
import 'package:compu_examen/entities/app_provider_entity.dart';

class AppProviderProvider extends ChangeNotifier {

  List<AppProvider> providers = [];

  AppProvider? selectedProvider;

  AppProviderProvider() {
    // fakeFetchAppProviders();
    fetchAppProviders();
  }

  Future<void> fetchAppProviders() async {
    providers = await ApiService().getProviderList();
    notifyListeners();
  }


  Future<void> addAppProvider({
    required String name,
    required String lastName,
    required String email,
    required bool isActive,
  }) async {

    await ApiService().addProvider(
      AppProvider(
        id: 0,
        name: name,
        lastName: lastName,
        email: email,
        isActive: isActive,
      )
    );

    fetchAppProviders();
  }
  


  Future<void> updateProvider({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required bool isActive,
  }) async {

    await ApiService().updateProvider(
      AppProvider(
        id: id,
        name: name,
        lastName: lastName,
        email: email,
        isActive: isActive,
      )
    );

    fetchAppProviders();

  }
  

  Future<void> deleteProvider( int id ) async {
    await ApiService().deleteProvider( id );
    fetchAppProviders();
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