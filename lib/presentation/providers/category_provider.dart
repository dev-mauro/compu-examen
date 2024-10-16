import 'package:compu_examen/helpers/api_service.dart';
import 'package:flutter/material.dart';
import 'package:compu_examen/entities/category_entity.dart';

class CategoryProvider extends ChangeNotifier {

  List<Category> categories = [];

  Category? selectedCategory;


  CategoryProvider() {
    // fakeFetchCategories();
    fetchCategories();
  }


  Future<void> fetchCategories() async {
    categories = await ApiService().getCategoryList();

    notifyListeners();
  }


  Future<void> addCategory({
    required String name,
  }) async {
    await ApiService().addCategory( name );
    fetchCategories();
  }


  Future<void> updateCategory({
    required int id,
    required String name,
    required bool isActive,
  }) async {

    await ApiService().updateCategory(
      Category(
        id: id,
        name: name,
        isActive: isActive,
      )
    );

    fetchCategories();
  }


  Future<void> deleteCategory( int id ) async {
    await ApiService().deleteCategory( id );
    fetchCategories();
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