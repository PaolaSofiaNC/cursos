// ignore_for_file: constant_identifier_names
import 'dart:convert';

class Welcome {
  String status;
  int results;
  DateTime requestAt;
  Data data;

  Welcome({
    required this.status,
    required this.results,
    required this.requestAt,
    required this.data,
  });

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        results: json["results"],
        requestAt: DateTime.parse(json["requestAt"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "requestAt": requestAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class Data {
  List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  Curso curso;
  User user;
  int precio;
  int cantidad;
  DateTime createdAt;
  bool pagado;

  Datum({
    required this.id,
    required this.curso,
    required this.user,
    required this.precio,
    required this.cantidad,
    required this.createdAt,
    required this.pagado,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        curso: Curso.fromJson(json["curso"]),
        user: User.fromJson(json["user"]),
        precio: json["precio"],
        cantidad: json["cantidad"],
        createdAt: DateTime.parse(json["createdAT"]),
        pagado: json["pagado"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "curso": curso.toJson(),
        "user": user.toJson(),
        "precio": precio,
        "cantidad": cantidad,
        "createdAT": createdAt.toIso8601String(),
        "pagado": pagado,
      };
}

class Modulo {
  ArchivoTemario imagenCover;
  ArchivoTemario archivoTemario;
  Reunion reunion;
  String id;
  Curso curso;
  String idCurso;
  String nombre;
  int numero;
  DateTime fechaInicio;
  String descripcionCard;
  bool activo;
  List<Materiale> materiales;
  List<dynamic> tareas;
  int v;

  Modulo({
    required this.imagenCover,
    required this.archivoTemario,
    required this.reunion,
    required this.id,
    required this.curso,
    required this.idCurso,
    required this.nombre,
    required this.numero,
    required this.fechaInicio,
    required this.descripcionCard,
    required this.activo,
    required this.materiales,
    required this.tareas,
    required this.v,
  });

  factory Modulo.fromRawJson(String str) => Modulo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Modulo.fromJson(Map<String, dynamic> json) => Modulo(
        imagenCover: ArchivoTemario.fromJson(json["imagenCover"]),
        archivoTemario: ArchivoTemario.fromJson(json["archivoTemario"]),
        reunion: Reunion.fromJson(json["reunion"]),
        id: json["_id"],
        curso: Curso.fromJson(json["curso"]),
        idCurso: json["idCurso"],
        nombre: json["nombre"],
        numero: json["numero"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        descripcionCard: json["descripcionCard"],
        activo: json["activo"],
        materiales: List<Materiale>.from(
            json["materiales"].map((x) => Materiale.fromJson(x))),
        tareas: List<dynamic>.from(json["tareas"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "imagenCover": imagenCover.toJson(),
        "archivoTemario": archivoTemario.toJson(),
        "reunion": reunion.toJson(),
        "_id": id,
        "curso": curso.toJson(),
        "idCurso": idCurso,
        "nombre": nombre,
        "numero": numero,
        "fechaInicio": fechaInicio.toIso8601String(),
        "descripcionCard": descripcionCard,
        "activo": activo,
        "materiales": List<dynamic>.from(materiales.map((x) => x.toJson())),
        "tareas": List<dynamic>.from(tareas.map((x) => x)),
        "__v": v,
      };
}

class Curso {
  ArchivoTemario imagenCover;
  ArchivoTemario banner;
  ArchivoTemario trailer;
  Evaluacion evaluacionInicial;
  Evaluacion evaluacionFinal;
  ArchivoTemario archivoTemario;
  Iktan iktan;
  Dc3 dc3;
  String id;
  String nombre;
  int duracion;
  String resumen;
  DateTime fechaInicio;
  DateTime fechaFinalizacion;
  int precio;
  int precioDescuento;
  int tamanoMaximoGrupo;
  String areaTematica;
  int calificacionPromedio;
  int cantidadCalificaciones;
  List<dynamic> startDates;
  String tipoCurso;
  List<Modulo>? modulos;
  bool cursoSecreto;
  bool activo;
  bool finalizado;
  List<dynamic> imagenes;
  List<dynamic> repositorioInformacion;
  String slug;
  int v;
  String cursoId;

  Curso({
    required this.imagenCover,
    required this.banner,
    required this.trailer,
    required this.evaluacionInicial,
    required this.evaluacionFinal,
    required this.archivoTemario,
    required this.iktan,
    required this.dc3,
    required this.id,
    required this.nombre,
    required this.duracion,
    required this.resumen,
    required this.fechaInicio,
    required this.fechaFinalizacion,
    required this.precio,
    required this.precioDescuento,
    required this.tamanoMaximoGrupo,
    required this.areaTematica,
    required this.calificacionPromedio,
    required this.cantidadCalificaciones,
    required this.startDates,
    required this.tipoCurso,
    this.modulos,
    required this.cursoSecreto,
    required this.activo,
    required this.finalizado,
    required this.imagenes,
    required this.repositorioInformacion,
    required this.slug,
    required this.v,
    required this.cursoId,
  });

  factory Curso.fromRawJson(String str) => Curso.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        imagenCover: ArchivoTemario.fromJson(json["imagenCover"]),
        banner: ArchivoTemario.fromJson(json["banner"]),
        trailer: ArchivoTemario.fromJson(json["trailer"]),
        evaluacionInicial: Evaluacion.fromJson(json["evaluacionInicial"]),
        evaluacionFinal: Evaluacion.fromJson(json["evaluacionFinal"]),
        archivoTemario: ArchivoTemario.fromJson(json["archivoTemario"]),
        iktan: Iktan.fromJson(json["iktan"]),
        dc3: Dc3.fromJson(json["dc3"]),
        id: json["_id"],
        nombre: json["nombre"],
        duracion: json["duracion"],
        resumen: json["resumen"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFinalizacion: DateTime.parse(json["fechaFinalizacion"]),
        precio: json["precio"],
        precioDescuento: json["precioDescuento"],
        tamanoMaximoGrupo: json["tamanoMaximoGrupo"],
        areaTematica: json["areaTematica"],
        calificacionPromedio: json["calificacionPromedio"],
        cantidadCalificaciones: json["cantidadCalificaciones"],
        startDates: List<dynamic>.from(json["startDates"].map((x) => x)),
        tipoCurso: json["tipoCurso"],
        modulos: json["modulos"] == null
            ? []
            : List<Modulo>.from(
                json["modulos"]!.map((x) => Modulo.fromJson(x))),
        cursoSecreto: json["cursoSecreto"],
        activo: json["activo"],
        finalizado: json["finalizado"],
        imagenes: List<dynamic>.from(json["imagenes"].map((x) => x)),
        repositorioInformacion:
            List<dynamic>.from(json["repositorioInformacion"].map((x) => x)),
        slug: json["slug"],
        v: json["__v"],
        cursoId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imagenCover": imagenCover.toJson(),
        "banner": banner.toJson(),
        "trailer": trailer.toJson(),
        "evaluacionInicial": evaluacionInicial.toJson(),
        "evaluacionFinal": evaluacionFinal.toJson(),
        "archivoTemario": archivoTemario.toJson(),
        "iktan": iktan.toJson(),
        "dc3": dc3.toJson(),
        "_id": id,
        "nombre": nombre,
        "duracion": duracion,
        "resumen": resumen,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFinalizacion": fechaFinalizacion.toIso8601String(),
        "precio": precio,
        "precioDescuento": precioDescuento,
        "tamanoMaximoGrupo": tamanoMaximoGrupo,
        "areaTematica": areaTematica,
        "calificacionPromedio": calificacionPromedio,
        "cantidadCalificaciones": cantidadCalificaciones,
        "startDates": List<dynamic>.from(startDates.map((x) => x)),
        "tipoCurso": tipoCurso,
        "modulos": modulos == null
            ? []
            : List<dynamic>.from(modulos!.map((x) => x.toJson())),
        "cursoSecreto": cursoSecreto,
        "activo": activo,
        "finalizado": finalizado,
        "imagenes": List<dynamic>.from(imagenes.map((x) => x)),
        "repositorioInformacion":
            List<dynamic>.from(repositorioInformacion.map((x) => x)),
        "slug": slug,
        "__v": v,
        "id": cursoId,
      };
}

class ArchivoTemario {
  String url;
  String key;

  ArchivoTemario({
    required this.url,
    required this.key,
  });

  factory ArchivoTemario.fromRawJson(String str) =>
      ArchivoTemario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArchivoTemario.fromJson(Map<String, dynamic> json) => ArchivoTemario(
        url: json["url"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "key": key,
      };
}

class Materiale {
  ArchivoTemario archivoMaterial;
  String nombre;
  String id;

  Materiale({
    required this.archivoMaterial,
    required this.nombre,
    required this.id,
  });

  factory Materiale.fromRawJson(String str) =>
      Materiale.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Materiale.fromJson(Map<String, dynamic> json) => Materiale(
        archivoMaterial: ArchivoTemario.fromJson(json["archivoMaterial"]),
        nombre: json["nombre"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "archivoMaterial": archivoMaterial.toJson(),
        "nombre": nombre,
        "_id": id,
      };
}

class Reunion {
  String nombre;
  String link;

  Reunion({
    required this.nombre,
    required this.link,
  });

  factory Reunion.fromRawJson(String str) => Reunion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reunion.fromJson(Map<String, dynamic> json) => Reunion(
        nombre: json["nombre"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "link": link,
      };
}

class Dc3 {
  ArchivoTemario logoIzquierdo;
  ArchivoTemario logoDerecho;
  Capacitador capacitador;

  Dc3({
    required this.logoIzquierdo,
    required this.logoDerecho,
    required this.capacitador,
  });

  factory Dc3.fromRawJson(String str) => Dc3.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dc3.fromJson(Map<String, dynamic> json) => Dc3(
        logoIzquierdo: ArchivoTemario.fromJson(json["logoIzquierdo"]),
        logoDerecho: ArchivoTemario.fromJson(json["logoDerecho"]),
        capacitador: Capacitador.fromJson(json["capacitador"]),
      );

  Map<String, dynamic> toJson() => {
        "logoIzquierdo": logoIzquierdo.toJson(),
        "logoDerecho": logoDerecho.toJson(),
        "capacitador": capacitador.toJson(),
      };
}

class Capacitador {
  ArchivoTemario photo;
  ArchivoTemario firmaElectronica;
  Id id;
  Nombre nombre;
  ApellidoPaterno apellidoPaterno;
  ApellidoMaterno apellidoMaterno;
  Correo correo;
  Role role;
  int? v;
  EmpresaCapacitador empresaCapacitador;
  PuestoCapacitador puestoCapacitador;
  bool confirmar;

  Capacitador({
    required this.photo,
    required this.firmaElectronica,
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.role,
    this.v,
    required this.empresaCapacitador,
    required this.puestoCapacitador,
    required this.confirmar,
  });

  factory Capacitador.fromRawJson(String str) =>
      Capacitador.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Capacitador.fromJson(Map<String, dynamic> json) => Capacitador(
        photo: ArchivoTemario.fromJson(json["photo"]),
        firmaElectronica: ArchivoTemario.fromJson(json["firmaElectronica"]),
        id: idValues.map[json["_id"]]!,
        nombre: nombreValues.map[json["nombre"]]!,
        apellidoPaterno: apellidoPaternoValues.map[json["apellidoPaterno"]]!,
        apellidoMaterno: apellidoMaternoValues.map[json["apellidoMaterno"]]!,
        correo: correoValues.map[json["correo"]]!,
        role: roleValues.map[json["role"]]!,
        v: json["__v"],
        empresaCapacitador:
            empresaCapacitadorValues.map[json["empresaCapacitador"]]!,
        puestoCapacitador:
            puestoCapacitadorValues.map[json["puestoCapacitador"]]!,
        confirmar: json["confirmar"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo.toJson(),
        "firmaElectronica": firmaElectronica.toJson(),
        "_id": idValues.reverse[id],
        "nombre": nombreValues.reverse[nombre],
        "apellidoPaterno": apellidoPaternoValues.reverse[apellidoPaterno],
        "apellidoMaterno": apellidoMaternoValues.reverse[apellidoMaterno],
        "correo": correoValues.reverse[correo],
        "role": roleValues.reverse[role],
        "__v": v,
        "empresaCapacitador":
            empresaCapacitadorValues.reverse[empresaCapacitador],
        "puestoCapacitador": puestoCapacitadorValues.reverse[puestoCapacitador],
        "confirmar": confirmar,
      };
}

enum ApellidoMaterno { LOVERA, WEST }

final apellidoMaternoValues = EnumValues(
    {"Lovera": ApellidoMaterno.LOVERA, "West": ApellidoMaterno.WEST});

enum ApellidoPaterno { CORDERO, COCHRAN }

final apellidoPaternoValues = EnumValues(
    {"Cochran": ApellidoPaterno.COCHRAN, "Cordero": ApellidoPaterno.CORDERO});

enum Correo { ADRIAN_GMAIL_COM, MERLIN_GMAIL_COM }

final correoValues = EnumValues({
  "adrian@gmail.com": Correo.ADRIAN_GMAIL_COM,
  "merlin@gmail.com": Correo.MERLIN_GMAIL_COM
});

enum EmpresaCapacitador { IKTAN_STRATEGIES, ASOCIACIN_MEXICANA_DE }

final empresaCapacitadorValues = EnumValues({
  "Asociación Mexicana de": EmpresaCapacitador.ASOCIACIN_MEXICANA_DE,
  "IKTAN Strategies": EmpresaCapacitador.IKTAN_STRATEGIES
});

enum Id {
  THE_63_FE6_E3_D5_A1219_C3_F7_D6_A92_B,
  THE_634_F641_AC83733_DE91444390
}

final idValues = EnumValues({
  "634f641ac83733de91444390": Id.THE_634_F641_AC83733_DE91444390,
  "63fe6e3d5a1219c3f7d6a92b": Id.THE_63_FE6_E3_D5_A1219_C3_F7_D6_A92_B
});

enum Nombre { ADRIN, MERLIN }

final nombreValues =
    EnumValues({"Adrián": Nombre.ADRIN, "Merlin": Nombre.MERLIN});

enum PuestoCapacitador { DIRECTOR_GENERAL }

final puestoCapacitadorValues =
    EnumValues({"Director General": PuestoCapacitador.DIRECTOR_GENERAL});

enum Role { CAPACITADOR }

final roleValues = EnumValues({"capacitador": Role.CAPACITADOR});

class Evaluacion {
  String link;
  bool activo;

  Evaluacion({
    required this.link,
    required this.activo,
  });

  factory Evaluacion.fromRawJson(String str) =>
      Evaluacion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Evaluacion.fromJson(Map<String, dynamic> json) => Evaluacion(
        link: json["link"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "activo": activo,
      };
}

class Iktan {
  ArchivoTemario logoIzquierdo;
  ArchivoTemario logoDerecho;
  ArchivoTemario logoFondo;
  Capacitador capacitadorUno;
  Capacitador capacitadorDos;
  String descripcion;

  Iktan({
    required this.logoIzquierdo,
    required this.logoDerecho,
    required this.logoFondo,
    required this.capacitadorUno,
    required this.capacitadorDos,
    required this.descripcion,
  });

  factory Iktan.fromRawJson(String str) => Iktan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Iktan.fromJson(Map<String, dynamic> json) => Iktan(
        logoIzquierdo: ArchivoTemario.fromJson(json["logoIzquierdo"]),
        logoDerecho: ArchivoTemario.fromJson(json["logoDerecho"]),
        logoFondo: ArchivoTemario.fromJson(json["logoFondo"]),
        capacitadorUno: Capacitador.fromJson(json["capacitadorUno"]),
        capacitadorDos: Capacitador.fromJson(json["capacitadorDos"]),
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "logoIzquierdo": logoIzquierdo.toJson(),
        "logoDerecho": logoDerecho.toJson(),
        "logoFondo": logoFondo.toJson(),
        "capacitadorUno": capacitadorUno.toJson(),
        "capacitadorDos": capacitadorDos.toJson(),
        "descripcion": descripcion,
      };
}

class User {
  Photo photo;
  String id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String correo;
  String role;
  bool confirmar;
  String token;
  int v;
  DateTime? contraseaResetExpires;
  String? contraseaResetToken;
  String? curp;
  String? ocupacionEspecifica;
  String? razonSocialEmpresa;
  String? representanteLegal;
  String? representanteTrabajadores;
  String? shcp;

  User({
    required this.photo,
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.role,
    required this.confirmar,
    required this.token,
    required this.v,
    required this.contraseaResetExpires,
    required this.contraseaResetToken,
    required this.curp,
    required this.ocupacionEspecifica,
    required this.razonSocialEmpresa,
    required this.representanteLegal,
    required this.representanteTrabajadores,
    required this.shcp,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        photo: Photo.fromJson(json["photo"]),
        id: json["_id"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        correo: json["correo"],
        role: json["role"],
        confirmar: json["confirmar"],
        token: json["token"],
        v: json["__v"],
        contraseaResetExpires: json["contraseñaResetExpires"] == null
            ? null
            : DateTime.parse(json["contraseñaResetExpires"]),
        contraseaResetToken: json["contraseñaResetToken"],
        curp: json["curp"],
        ocupacionEspecifica: json["ocupacionEspecifica"],
        razonSocialEmpresa: json["razonSocialEmpresa"],
        representanteLegal: json["representanteLegal"],
        representanteTrabajadores: json["representanteTrabajadores"],
        shcp: json["shcp"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo.toJson(),
        "_id": id,
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "correo": correo,
        "role": role,
        "confirmar": confirmar,
        "token": token,
        "__v": v,
        "contraseñaResetExpires": contraseaResetExpires?.toIso8601String(),
        "contraseñaResetToken": contraseaResetToken,
        "curp": curp,
        "ocupacionEspecifica": ocupacionEspecifica,
        "razonSocialEmpresa": razonSocialEmpresa,
        "representanteLegal": representanteLegal,
        "representanteTrabajadores": representanteTrabajadores,
        "shcp": shcp,
      };
}

class Photo {
  String url;

  Photo({
    required this.url,
  });

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
