import 'package:compu_examen/entities/product_entity.dart';
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

/*
- Para agregar use:
	(POST) ejemplos/product_add_rest/
		{
		  "product_name":"nombre",
		  "product_price":100,
		  "product_image":"https://emprendepyme.net/wp-content/uploads/2023/03/cualidades-producto-1200x900.jpg"
		}
*/

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

  /*
  - Para editar use:
	(POST) ejemplos/product_edit_rest/
		{
		  "product_id":1,
		  "product_name":"nombre",
		  "product_price":100,
		  "product_image":"https://emprendepyme.net/wp-content/uploads/2023/03/cualidades-producto-1200x900.jpg",
		  "product_state":"Activo"
		} 
   */

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

  /*
  - Para eliminar use:
	(POST) ejemplos/product_del_rest/
		{
		  "product_id":1
		} 
  */

  Future<void> deleteProduct( int id ) async {
    final response = await _dio.post(
      '/product_del_rest/',
      data: {
        "product_id": id,
      }
    );

    print( response.data );
  }

}