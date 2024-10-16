
class ProvidersListModel {
    List<AppProviderModel> proveedoresListado;

    ProvidersListModel({
        required this.proveedoresListado,
    });

    factory ProvidersListModel.fromJson(Map<String, dynamic> json) => ProvidersListModel(
        proveedoresListado: List<AppProviderModel>.from(json["Proveedores Listado"].map((x) => AppProviderModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Proveedores Listado": List<dynamic>.from(proveedoresListado.map((x) => x.toJson())),
    };
}

class AppProviderModel {
    int providerid;
    String providerName;
    String providerLastName;
    String providerMail;
    String providerState;

    AppProviderModel({
        required this.providerid,
        required this.providerName,
        required this.providerLastName,
        required this.providerMail,
        required this.providerState,
    });

    factory AppProviderModel.fromJson(Map<String, dynamic> json) => AppProviderModel(
        providerid: json["providerid"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        providerState: json["provider_state"],
    );

    Map<String, dynamic> toJson() => {
        "providerid": providerid,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        "provider_state": providerState,
    };
}
