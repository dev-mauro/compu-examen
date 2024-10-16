import 'package:compu_examen/entities/app_provider_entity.dart';
import 'package:compu_examen/entities/category_entity.dart';
import 'package:compu_examen/entities/product_entity.dart';
import 'package:compu_examen/models/app_provider_model.dart';
import 'package:compu_examen/models/category_model.dart';
import 'package:compu_examen/models/product_model.dart';
import 'package:dio/dio.dart';

class ApiService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://143.198.118.203:8100/ejemplos",
      headers: {
        "authorization": "Basic dGVzdDp0ZXN0MjAyMw==",
      },
    ),
  );


  // GET products
  Future< List<Product> > getProductList() async {
    final response = await _dio.get('/product_list_rest/');

    // Mapea la respuesta de la api
    // Obtiene una lista con modelos de productos
    final ProductListModel productListModel = ProductListModel.fromJson( response.data );

    // Convierte el modelo del producto a la entidad de producto
    final List<Product> products = productListModel.listado.map(
      ( productModel ) => Product(
        id: productModel.productId,
        name: productModel.productName,
        price: productModel.productPrice,
        imageUrl: productModel.productImage,
        isActive: productModel.productState == 'Activo',
    )).toList();

    return products;
  }


  // POST products
  Future<void> addProduct( Product product ) async {

    final response = await _dio.post(
      '/product_add_rest/',
      data: {
        "product_name": product.name,
        "product_price": product.price,
        "product_image": product.imageUrl,
      }
    );

    print( response.data );

  }


  // PUT products
  Future<void> updateProduct( Product product ) async {
    final response = await _dio.post(
      '/product_edit_rest/',
      data: {
        "product_id": product.id,
        "product_name": product.name,
        "product_price": product.price,
        "product_image": product.imageUrl,
        "product_state": product.isActive ? 'Activo' : 'Inactivo',
      }
    );

    print( response.data );
  }


  // DELETE products
  Future<void> deleteProduct( int id ) async {
    final response = await _dio.post(
      '/product_del_rest/',
      data: {
        "product_id": id,
      }
    );

    print( response.data );
  }


  // GET categories
  Future< List<Category> > getCategoryList() async {
    final response = await _dio.get('/category_list_rest/');

    // Mapea la respuesta de la api
    // Obtiene una lista con modelos de categorias
    final CategoryListModel categoryListModel = CategoryListModel.fromJson( response.data );

    // Convierte el modelo de categoria a la entidad de categoria
    final List<Category> categories = categoryListModel.listadoCategorias.map(
      ( categoryModel ) => Category(
        id: categoryModel.categoryId,
        name: categoryModel.categoryName,
        isActive: categoryModel.categoryState == 'Activo',
    )).toList();

    return categories;
  }


  // POST categories
  Future<void> addCategory( String name ) async {
    final response = await _dio.post(
      '/category_add_rest/',
      data: {
        "category_name": name,
      }
    );

    print( response.data );
  }


  // PUT categories
  Future<void> updateCategory( Category category ) async {
    final response = await _dio.post(
      '/category_edit_rest/',
      data: {
        "category_id": category.id,
        "category_name": category.name,
        "category_state": category.isActive ? 'Activo' : 'Inactivo',
      }
    );

    print( response.data );
  }


  // DELETE categories
  Future<void> deleteCategory( int id ) async {
    final response = await _dio.post(
      '/category_del_rest/',
      data: {
        "category_id": id,
      }
    );

    print( response.data );
  }


  // GET providers
  Future< List<AppProvider> > getProviderList() async {
    final response = await _dio.get('/provider_list_rest/');

    // Mapea la respuesta de la api
    // Obtiene una lista con modelos de proveedores
    final ProvidersListModel appProviderListModel = ProvidersListModel.fromJson( response.data );

    // Convierte el modelo del proveedor a la entidad de proveedor
    final List<AppProvider> providers = appProviderListModel.proveedoresListado.map(
      ( appProviderModel ) => AppProvider(
        id: appProviderModel.providerid,
        name: appProviderModel.providerName,
        lastName: appProviderModel.providerLastName,
        email: appProviderModel.providerMail,
        isActive: appProviderModel.providerState == 'Activo',
    )).toList();

    return providers;
  }


  // POST providers
  Future<void> addProvider( AppProvider provider ) async {
    final response = await _dio.post(
      '/provider_add_rest/',
      data: {
        "provider_name": provider.name,
        "provider_last_name": provider.lastName,
        "provider_mail": provider.email,
        "provider_state": provider.isActive ? 'Activo' : 'Inactivo',
      }
    );

    print( response.data );
  }

  // PUT providers
  Future<void> updateProvider( AppProvider provider ) async {
    final response = await _dio.post(
      '/provider_edit_rest/',
      data: {
        "provider_id": provider.id,
        "provider_name": provider.name,
        "provider_last_name": provider.lastName,
        "provider_mail": provider.email,
        "provider_state": provider.isActive ? 'Activo' : 'Inactivo',
      }
    );

    print( response.data );
  }

  // DELETE providers
  Future<void> deleteProvider( int id ) async {
    final response = await _dio.post(
      '/provider_del_rest/',
      data: {
        "provider_id": id,
      }
    );

    print( response.data );
  }

}