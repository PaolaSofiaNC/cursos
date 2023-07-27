import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactanosScreen extends StatefulWidget {
  const ContactanosScreen({super.key});

  @override
  State<ContactanosScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactanosScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contactanos',
          style: TextStyle(
            fontFamily: AppTheme.fontTitle,
            letterSpacing: 3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '¡Ponerse en contacto!',
                style: TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Complete el siguiente formulario para enviarnos un mensaje.',
                style: TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  fontSize: 16.0,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  nombreContacto(_nameController),
                  SizedBox(height: size.height * 0.03),
                  emailContacto(_emailController),
                  SizedBox(height: size.height * 0.03),
                  mensajeContacto(_messageController),
                  SizedBox(height: size.height * 0.03),
                  BtnEnviarMsj(
                    correo: _emailController,
                    formKey: _formKey,
                    mensaje: _messageController,
                    nombre: _nameController,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}

Widget nombreContacto(TextEditingController nombre) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-2, 2),
            blurRadius: 2,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: Center(
        child: TextFormField(
          controller: nombre,
          style: const TextStyle(
            fontFamily: AppTheme.fontCuerpo,
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 2,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor ingrese su nombre completo';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.person,
              color: AppTheme.primary,
            ),
            hintText: 'Nombre',
            hintStyle: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              color: Colors.black38,
              fontSize: 15,
              letterSpacing: 3,
            ),
          ),
          cursorColor: AppTheme.primary,
        ),
      ),
    ),
  );
}

Widget emailContacto(TextEditingController email) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-2, 2),
            blurRadius: 2,
            color: Colors.black26,
          ),
        ],
      ),
      height: 60,
      child: TextFormField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          color: Colors.black,
          fontSize: 16,
          letterSpacing: 2,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingresa un email';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Por favor ingrese un email valido';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.email,
            color: AppTheme.primary,
          ),
          hintText: 'Correo electronico',
          hintStyle: TextStyle(
            fontFamily: AppTheme.fontCuerpo,
            color: Colors.black38,
            fontSize: 15,
            letterSpacing: 3,
          ),
        ),
        cursorColor: AppTheme.primary,
      ),
    ),
  );
}

Widget mensajeContacto(TextEditingController mensaje) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-2, 2),
            blurRadius: 2,
            color: Colors.black26,
          ),
        ],
      ),
      height: 100,
      child: Center(
        child: TextFormField(
          controller: mensaje,
          maxLines: 5,
          style: const TextStyle(
            fontFamily: AppTheme.fontCuerpo,
            color: Colors.black,
            fontSize: 15,
            letterSpacing: 1,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor ingrese su mensaje';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: 'Mensaje',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 40, right: 5),
            prefixIcon: Icon(
              Icons.edit_square,
              color: AppTheme.primary,
            ),
            hintStyle: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              color: Colors.black38,
              fontSize: 15,
              letterSpacing: 3,
            ),
          ),
          cursorColor: AppTheme.primary,
        ),
      ),
    ),
  );
}

class BtnEnviarMsj extends StatelessWidget {
  final TextEditingController nombre;
  final TextEditingController correo;
  final TextEditingController mensaje;
  final GlobalKey<FormState> formKey;

  const BtnEnviarMsj(
      {super.key,
      required this.nombre,
      required this.correo,
      required this.mensaje,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () async {
          if (formKey.currentState!.validate()) {
            final Email email = Email(
              body:
                  'Estimado equipo de Iktan,\n Es un placer saludarles. Mi nombre es ${nombre.text}  y mi correo es ${correo.text}, me dirijo a ustedes para informarles sobre,\n${mensaje.text}\n\n Agradezco de antemano su atención y pronta respuesta.\n\n Saludos cordiales,\n${nombre.text}',
              subject: 'Informes',
              recipients: ['victor@iktanst.com'],
              isHTML: false,
            );

            try {
              await FlutterEmailSender.send(email);
              nombre.clear();
              correo.clear();
              mensaje.clear();
            } catch (e) {
              showSnackbarContac(
                  context, "No se tiene una cuenta de gmail abierta.");
            }
          }
        },
        child: Container(
          height: size.height * 0.07,
          width: size.width * 0.45,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(0.0, 2.0),
                blurRadius: 2.0,
                color: Colors.black12,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width * 0.35,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    topLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(200),
                  ),
                ),
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    letterSpacing: 4,
                    fontSize: 14,
                    color: AppTheme.baseBlanca,
                  ),
                ),
              ),
              Icon(
                Icons.send,
                size: size.height * 0.045,
                color: AppTheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackbarContac(BuildContext context, String msj) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msj),
      duration: const Duration(seconds: 2),
      backgroundColor: AppTheme.primary,
    ),
  );
}
