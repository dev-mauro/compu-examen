
class ProductListModel {
    List<ProductModel> listado;

    ProductListModel({
        required this.listado,
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        listado: List<ProductModel>.from(json["Listado"].map((x) => ProductModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      "Listado": List<dynamic>.from(listado.map((x) => x.toJson())),
    };
}

class ProductModel {
    int productId;
    String productName;
    int productPrice;
    String productImage;
    String productState;

    ProductModel({
        required this.productId,
        required this.productName,
        required this.productPrice,
        required this.productImage,
        required this.productState,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productImage: json["product_image"],
        productState: json["product_state"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_image": productImage,
        "product_state": productState,
    };
}
