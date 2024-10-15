import 'package:compu_examen/entities/product_entity.dart';
import 'package:compu_examen/helpers/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  Product? selectedProduct;


  ProductProvider() {
    // fakeFetchProducts();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    products = await ApiService().getProductList();
    notifyListeners();
  }

  // Agrega un producto
  Future<void> addProduct({
    required String name,
    required int price,
    String? imageUrl,
  }) async {

    if ( imageUrl == null || imageUrl.isEmpty ) {
      imageUrl = 'https://as2.ftcdn.net/v2/jpg/02/51/95/53/1000_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg';
    }

    final newProduct = Product(
      id: 0,
      name: name,
      price: price,
      imageUrl: imageUrl,
    );

    await ApiService().addProduct( newProduct );
    fetchProducts();
  }



  Future<void> updateProduct({
    required int id,
    required String name,
    required int price,
    required bool isActive,
    String? imageUrl,
  }) async {
    if ( imageUrl == null || imageUrl.isEmpty ) {
      imageUrl = 'https://as2.ftcdn.net/v2/jpg/02/51/95/53/1000_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg';
    }

    final updatedProduct = Product(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      isActive: isActive,
    );

    await ApiService().updateProduct( updatedProduct);
    fetchProducts();

  }

  Future<void> deleteProduct({
    required int id
  }) async {
    await ApiService().deleteProduct( id );
    selectedProduct = null;
    fetchProducts();
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