import 'package:compu_examen/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  Product? selectedProduct;


  ProductProvider() {
    fakeFetchProducts();
  }

  Future<void> fetchProducts() async {
    // TODO: Obtener los productos de la API
  }

  Future<void> addProduct({
    required String name,
    required int price,
    String? imageUrl,
  }) async {
    // TODO: Agregar un producto a la API
  }


  // Selecciona un producto para editarlo
  void selectProduct( Product product ) {
    selectedProduct = product;
    notifyListeners();
  }
  
  
  void fakeFetchProducts() {
    products = [
      Product(
        id: 1,
        name: 'Producto 1',
        price: 100,
        imageUrl: 'https://picsum.photos/150',
      ),
      Product(
        id: 2,
        name: 'Producto 2',
        price: 200,
        imageUrl: 'https://picsum.photos/150',
      ),
      Product(
        id: 3,
        name: 'Producto 3',
        price: 300,
        imageUrl: 'https://picsum.photos/150',
      ),
      Product(
        id: 4,
        name: 'Producto 4',
        price: 400,
        imageUrl: 'https://picsum.photos/150',
      ),
      Product(
        id: 5,
        name: 'Producto 5',
        price: 500,
        imageUrl: 'https://picsum.photos/150',
        isActive: false
      ),

    ];

    notifyListeners();
  }


}