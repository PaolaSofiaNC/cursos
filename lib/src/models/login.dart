import 'dart:convert';

class Cursos {
  String status;
  String token;
  Data data;

  Cursos({
    required this.status,
    required this.token,
    required this.data,
  });

  factory Cursos.fromRawJson(String str) => Cursos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cursos.fromJson(Map<String, dynamic> json) => Cursos(
        status: json["status"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  bool checkToken;

  Data({
    required this.user,
    required this.checkToken,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        checkToken: json["checkToken"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "checkToken": checkToken,
      };
}

class User {
  FirmaElectronica photo;
  FirmaElectronica? firmaElectronica;
  String id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String correo;
  String role;
  bool confirmar;
  String token;
  int? v;
  String? empresaCapacitador;
  String? puestoCapacitador;

  User({
    required this.photo,
    required this.firmaElectronica,
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.role,
    required this.confirmar,
    required this.token,
    required this.v,
    required this.empresaCapacitador,
    required this.puestoCapacitador,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: FirmaElectronica.fromJson(json["photo"]),
        firmaElectronica: json["firmaElectronica"] != null
            ? FirmaElectronica.fromJson(json["firmaElectronica"])
            : null,
        id: json["_id"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        correo: json["correo"],
        role: json["role"],
        confirmar: json["confirmar"],
        token: json["token"],
        v: json["__v"],
        empresaCapacitador: json["empresaCapacitador"],
        puestoCapacitador: json["puestoCapacitador"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo.toJson(),
        "firmaElectronica": firmaElectronica?.toJson(),
        "_id": id,
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "correo": correo,
        "role": role,
        "confirmar": confirmar,
        "token": token,
        "__v": v,
        "empresaCapacitador": empresaCapacitador,
        "puestoCapacitador": puestoCapacitador,
      };
}

class FirmaElectronica {
  String url;
  String? key;

  FirmaElectronica({
    required this.url,
    required this.key,
  });

  factory FirmaElectronica.fromRawJson(String str) =>
      FirmaElectronica.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirmaElectronica.fromJson(Map<String, dynamic> json) =>
      FirmaElectronica(
        url: json["url"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "key": key,
      };
}
