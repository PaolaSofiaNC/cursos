import 'dart:convert';

class PeticionConstancias {
  String status;
  int results;
  DateTime requestAt;
  Data data;

  PeticionConstancias({
    required this.status,
    required this.results,
    required this.requestAt,
    required this.data,
  });

  factory PeticionConstancias.fromJson(String str) =>
      PeticionConstancias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeticionConstancias.fromMap(Map<String, dynamic> json) =>
      PeticionConstancias(
        status: json["status"],
        results: json["results"],
        requestAt: DateTime.parse(json["requestAt"]),
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "results": results,
        "requestAt": requestAt.toIso8601String(),
        "data": data.toMap(),
      };
}

class Data {
  List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Constancias constancias;
  String id;
  Curso curso;
  User user;
  String folio;
  DateTime createdAt;

  Datum({
    required this.constancias,
    required this.id,
    required this.curso,
    required this.user,
    required this.folio,
    required this.createdAt,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        constancias: Constancias.fromMap(json["constancias"]),
        id: json["_id"],
        curso: Curso.fromMap(json["curso"]),
        user: User.fromMap(json["user"]),
        folio: json["folio"],
        createdAt: DateTime.parse(json["createdAT"]),
      );

  Map<String, dynamic> toMap() => {
        "constancias": constancias.toMap(),
        "_id": id,
        "curso": curso.toMap(),
        "user": user.toMap(),
        "folio": folio,
        "createdAT": createdAt.toIso8601String(),
      };
}

class Constancias {
  String iktanUrl;
  String dc3Url;

  Constancias({
    required this.iktanUrl,
    required this.dc3Url,
  });

  factory Constancias.fromJson(String str) =>
      Constancias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Constancias.fromMap(Map<String, dynamic> json) => Constancias(
        iktanUrl: json["iktanUrl"],
        dc3Url: json["dc3Url"],
      );

  Map<String, dynamic> toMap() => {
        "iktanUrl": iktanUrl,
        "dc3Url": dc3Url,
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
    required this.cursoSecreto,
    required this.activo,
    required this.finalizado,
    required this.imagenes,
    required this.repositorioInformacion,
    required this.slug,
    required this.v,
    required this.cursoId,
  });

  factory Curso.fromJson(String str) => Curso.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Curso.fromMap(Map<String, dynamic> json) => Curso(
        imagenCover: ArchivoTemario.fromMap(json["imagenCover"]),
        banner: ArchivoTemario.fromMap(json["banner"]),
        trailer: ArchivoTemario.fromMap(json["trailer"]),
        evaluacionInicial: Evaluacion.fromMap(json["evaluacionInicial"]),
        evaluacionFinal: Evaluacion.fromMap(json["evaluacionFinal"]),
        archivoTemario: ArchivoTemario.fromMap(json["archivoTemario"]),
        iktan: Iktan.fromMap(json["iktan"]),
        dc3: Dc3.fromMap(json["dc3"]),
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

  Map<String, dynamic> toMap() => {
        "imagenCover": imagenCover.toMap(),
        "banner": banner.toMap(),
        "trailer": trailer.toMap(),
        "evaluacionInicial": evaluacionInicial.toMap(),
        "evaluacionFinal": evaluacionFinal.toMap(),
        "archivoTemario": archivoTemario.toMap(),
        "iktan": iktan.toMap(),
        "dc3": dc3.toMap(),
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

  factory ArchivoTemario.fromJson(String str) =>
      ArchivoTemario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArchivoTemario.fromMap(Map<String, dynamic> json) => ArchivoTemario(
        url: json["url"],
        key: json["key"],
      );

  Map<String, dynamic> toMap() => {
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

  factory Materiale.fromJson(String str) => Materiale.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Materiale.fromMap(Map<String, dynamic> json) => Materiale(
        archivoMaterial: ArchivoTemario.fromMap(json["archivoMaterial"]),
        nombre: json["nombre"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "archivoMaterial": archivoMaterial.toMap(),
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

  factory Reunion.fromJson(String str) => Reunion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reunion.fromMap(Map<String, dynamic> json) => Reunion(
        nombre: json["nombre"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "link": link,
      };
}

class Dc3 {
  ArchivoTemario logoIzquierdo;
  ArchivoTemario logoDerecho;
  User capacitador;

  Dc3({
    required this.logoIzquierdo,
    required this.logoDerecho,
    required this.capacitador,
  });

  factory Dc3.fromJson(String str) => Dc3.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dc3.fromMap(Map<String, dynamic> json) => Dc3(
        logoIzquierdo: ArchivoTemario.fromMap(json["logoIzquierdo"]),
        logoDerecho: ArchivoTemario.fromMap(json["logoDerecho"]),
        capacitador: User.fromMap(json["capacitador"]),
      );

  Map<String, dynamic> toMap() => {
        "logoIzquierdo": logoIzquierdo.toMap(),
        "logoDerecho": logoDerecho.toMap(),
        "capacitador": capacitador.toMap(),
      };
}

class User {
  ArchivoTemario photo;
  ArchivoTemario? firmaElectronica;
  String id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String correo;
  String role;
  int? v;
  String? empresaCapacitador;
  String? puestoCapacitador;
  bool confirmar;
  String? token;
  DateTime? contraseaActualizadaAt;

  User({
    required this.photo,
    this.firmaElectronica,
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.role,
    this.v,
    this.empresaCapacitador,
    this.puestoCapacitador,
    required this.confirmar,
    this.token,
    this.contraseaActualizadaAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        photo: ArchivoTemario.fromMap(json["photo"]),
        firmaElectronica: json["firmaElectronica"] == null
            ? null
            : ArchivoTemario.fromMap(json["firmaElectronica"]),
        id: json["_id"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellidoPaterno"],
        apellidoMaterno: json["apellidoMaterno"],
        correo: json["correo"],
        role: json["role"],
        v: json["__v"],
        empresaCapacitador: json["empresaCapacitador"],
        puestoCapacitador: json["puestoCapacitador"],
        confirmar: json["confirmar"],
        token: json["token"],
        contraseaActualizadaAt: json["contraseñaActualizadaAt"] == null
            ? null
            : DateTime.parse(json["contraseñaActualizadaAt"]),
      );

  Map<String, dynamic> toMap() => {
        "photo": photo.toMap(),
        "firmaElectronica": firmaElectronica?.toMap(),
        "_id": id,
        "nombre": nombre,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "correo": correo,
        "role": role,
        "__v": v,
        "empresaCapacitador": empresaCapacitador,
        "puestoCapacitador": puestoCapacitador,
        "confirmar": confirmar,
        "token": token,
        "contraseñaActualizadaAt": contraseaActualizadaAt?.toIso8601String(),
      };
}

class Evaluacion {
  String link;
  bool activo;

  Evaluacion({
    required this.link,
    required this.activo,
  });

  factory Evaluacion.fromJson(String str) =>
      Evaluacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Evaluacion.fromMap(Map<String, dynamic> json) => Evaluacion(
        link: json["link"],
        activo: json["activo"],
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "activo": activo,
      };
}

class Iktan {
  ArchivoTemario logoIzquierdo;
  ArchivoTemario logoDerecho;
  ArchivoTemario logoFondo;
  User capacitadorUno;
  User capacitadorDos;
  String descripcion;

  Iktan({
    required this.logoIzquierdo,
    required this.logoDerecho,
    required this.logoFondo,
    required this.capacitadorUno,
    required this.capacitadorDos,
    required this.descripcion,
  });

  factory Iktan.fromJson(String str) => Iktan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Iktan.fromMap(Map<String, dynamic> json) => Iktan(
        logoIzquierdo: ArchivoTemario.fromMap(json["logoIzquierdo"]),
        logoDerecho: ArchivoTemario.fromMap(json["logoDerecho"]),
        logoFondo: ArchivoTemario.fromMap(json["logoFondo"]),
        capacitadorUno: User.fromMap(json["capacitadorUno"]),
        capacitadorDos: User.fromMap(json["capacitadorDos"]),
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "logoIzquierdo": logoIzquierdo.toMap(),
        "logoDerecho": logoDerecho.toMap(),
        "logoFondo": logoFondo.toMap(),
        "capacitadorUno": capacitadorUno.toMap(),
        "capacitadorDos": capacitadorDos.toMap(),
        "descripcion": descripcion,
      };
}
