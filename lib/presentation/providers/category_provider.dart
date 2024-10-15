import 'package:flutter/material.dart';
import 'package:compu_examen/entities/category_entity.dart';

class CategoryProvider extends ChangeNotifier {

  List<Category> categories = [];

  Category? selectedCategory;


  CategoryProvider() {
    fakeFetchCategories();
  }


  Future<void> fetchCategories() async {
    // TODO: lógica para obtener las categorias
  }

  Future<void> addCategory({
    required String name,
    String? imageUrl,
  }) async {
    // TODO: lógica para agregar una categoria
  }

  void selectCategory( Category category ) {
    selectedCategory = category;
    notifyListeners();
  }

  void fakeFetchCategories() {
    categories = [
      Category(
        id: 1,
        name: 'Juegos',
      ),
      Category(
        id: 2,
        name: 'Ropa',
      ),
      Category(
        id: 3,
        name: 'Música',
      ),
      Category(
        id: 4,
        name: 'Electrónicos',
      ),
      Category(
        id: 5,
        name: 'Juguetería',
        isActive: false,
      ),
    ];
  }



}