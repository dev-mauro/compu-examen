
class CategoryListModel {
    List<CategoryModel> listadoCategorias;

    CategoryListModel({
        required this.listadoCategorias,
    });

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
        listadoCategorias: List<CategoryModel>.from(json["Listado Categorias"].map((x) => CategoryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Listado Categorias": List<dynamic>.from(listadoCategorias.map((x) => x.toJson())),
    };
}

class CategoryModel {
    int categoryId;
    String categoryName;
    String categoryState;

    CategoryModel({
        required this.categoryId,
        required this.categoryName,
        required this.categoryState,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_state": categoryState,
    };
}