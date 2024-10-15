
class LocalVideoModel {
    List<ProveedoresListado> proveedoresListado;

    LocalVideoModel({
        required this.proveedoresListado,
    });

    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        proveedoresListado: List<ProveedoresListado>.from(json["Proveedores Listado"].map((x) => ProveedoresListado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Proveedores Listado": List<dynamic>.from(proveedoresListado.map((x) => x.toJson())),
    };
}

class ProveedoresListado {
    int providerid;
    String providerName;
    String providerLastName;
    String providerMail;
    String providerState;

    ProveedoresListado({
        required this.providerid,
        required this.providerName,
        required this.providerLastName,
        required this.providerMail,
        required this.providerState,
    });

    factory ProveedoresListado.fromJson(Map<String, dynamic> json) => ProveedoresListado(
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
