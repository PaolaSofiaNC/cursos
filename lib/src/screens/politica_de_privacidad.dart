import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/figura_mancha_widget.dart';

class PoliticaDePrivacidad extends StatelessWidget {
  const PoliticaDePrivacidad({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        FiguraManchaWidget(
            color: const Color.fromARGB(100, 248, 178, 51),
            pTop: size.height * 0.075,
            pRight: 0,
            pBottom: 0,
            pLeft: 0),
        const FiguraManchaWidget(
            color: AppTheme.primary, pTop: 0, pRight: 0, pBottom: 0, pLeft: 0),
        Column(
          children: [
            SizedBox(
              height: size.height * 0.22,
            ),
            const TextoPolitica(),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: TextoPoliticaPrivacidad(),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class TextoPolitica extends StatelessWidget {
  const TextoPolitica({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Política de Privacidad',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 35,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class TextoPoliticaPrivacidad extends StatelessWidget {
  const TextoPoliticaPrivacidad({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'AVISO DE PRIVACIDAD INTEGRAL  (Strategies)',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nEste Aviso de Privacidad tiene por objeto proporcionarle una visión clara de cómo usamos los datos personales que el titular de datos personales (en lo sucesivo “Usted”) nos proporciona, nuestros esfuerzos por protegerlos, las opciones que tiene para controlar sus datos personales y proteger su privacidad, asimismo, la forma en que utilizamos sus datos personales y los terceros con los que la compartiremos. IKTAN IKTAN Strategies S.A.P.I DE C.V (en lo sucesivo IKTAN Strategies) informa, mediante el presente Aviso de Privacidad integral y en relación con el uso y protección de los datos personales que Usted ponga a disposición de IKTAN Strategies, lo siguiente:

En cumplimiento con la Ley Federal de Protección de Datos Personales en Posesión de los Particulares y su Reglamento (en lo sucesivo, la "Ley de Datos"), así como de conformidad con los Lineamientos del Aviso de Privacidad publicados en el Diario Oficial de la Federación el 17 de enero de 2013, se informa lo siguiente:

Que el tratamiento de los datos personales por parte de IKTAN Strategies, busca apegarse y ser conforme con los principios de licitud, consentimiento, información, calidad, finalidad, lealtad, proporcionalidad y responsabilidad que tutela la Ley de Datos; de la misma forma se busca que dicho tratamiento sea legítimo, controlado e informado, con la finalidad de garantizar la privacidad y la protección de los mismos, así como garantizar el derecho de autodeterminación informativa del titular de dichos datos.
''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'I. IDENTIDAD Y DOMICILIO DEL RESPONSABLE:',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nIKTAN Strategies S.A.P.I DE C.V con domicilio en Av. Jardín 251, Tlatilco, Azcapotzalco, 02860 Ciudad de México, CDMX, le informa que será el responsable de recabar sus datos personales, del uso que se le dé a los mismos y de su protección, comprometiéndose a respetar y cumplir con lo establecido en el presente Aviso de Privacidad y la Ley de Datos.IKTAN Strategies le informa que sus datos personales serán tratados y resguardados con base en los principios de licitud, calidad, consentimiento, información, finalidad, lealtad, proporcionalidad y responsabilidad, establecidos en la Ley de Datos y su Reglamento.
Al proporcionar sus datos personales a IKTAN Strategies, Usted otorga su consentimiento para que recabe y utilice dichos datos únicamente para los fines descritos en el presente Aviso de Privacidad. \n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'II. FINALIDADES DEL TRATAMIENTO DE DATOS PERSONALES',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nLa información de los usuarios de IKTAN Strategies será utilizada para las siguientes finalidades principales:
1. Fines de identificación;
2. Crear y mantener actualizada la base de datos interna;
3. Permitirle el acceso a los cursos que lleve a cabo IKTAN Strategies
4. Enviarle vía correo electrónico invitaciones a nuestros cursos e información de interés relacionada con
5. Enviarle físicamente a su domicilio las constancias de los cursos realizados en IKTAN Strategies

IKTAN Strategies cuenta con los recursos tecnológicos, materiales y humanos, así como con procedimientos para proteger sus datos personales y prevenir accesos no autorizados, uso o divulgación de los mismos, sin importar donde se traten los datos personales. No obstante, usted podrá manifestar su negativa para el tratamiento de sus datos personales para cualquiera de las finalidades listadas rechazando el presente Aviso de Privacidad. En caso contrario se entenderá que usted como titular, consiente el tratamiento de sus datos personales para todas las finalidades enumeradas anteriormente. \n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 40,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'III. DATOS PERSONALES QUE PODRÁN SER RECABADOS Y TRATADOS',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nPara llevar a cabo las finalidades descritas en el presente Aviso de Privacidad, los datos personales que serán recabados, utilizados y tratados son (en lo sucesivo denominados como los “Datos Personales”): \n 
*Nombre completo
*Número telefónico, fijo o celular.
*CURP
*Puesto de trabajo
*Ocupación específica
*Correo electrónico
*Domicilio \n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'IV. TRANSFERENCIA DE DATOS PERSONALES',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nSe hace de su conocimiento en términos de lo dispuesto por el artículo 37 fracciones IV, V, VI, VII de la Ley y 68 del Reglamento, que IKTAN Strategies podrá divulgar y transferir sus Datos Personales. En estos casos, IKTAN Strategies tomará todas las medidas necesarias para solicitar que se protejan adecuadamente sus Datos Personales, de conformidad con la Ley de Datos y las políticas de privacidad para la protección de los mismos. IKTAN Strategies no podrá transferir los Datos Personales a terceros sin su consentimiento, salvo por lo previsto en el presente Aviso de Privacidad y por las excepciones previstas en el artículo 37 de la ley.\n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'VI. MEDIOS PARA EJERCER LOS DERECHOS DE ACCESO, RECTIFICACIÓN, CANCELACIÓN U OPOSICIÓN (“DERECHOS ARCO”).',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 4,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nDe conformidad con el artículo 22,23,24 y 25 de la Ley de Datos, Usted tiene el derecho de acceder a los datos que posee IKTAN Strategies y a los detalles del tratamiento de éstos, así como a rectificarlos en caso de ser inexactos o incompletos; cancelarlos en los términos de la Ley de Datos u oponerse al tratamiento de estos para fines específicos. \n
Para ejercer los Derechos ARCO, Usted o su representante legal deberán elaborar la "Solicitud Ejercicio de los Derechos ARCO" y enviarla escaneada al correo electrónico: contacto@iktanst.com, para su atención y seguimiento. Es importante que considere los siguientes puntos al momento de enviar o entregar su solicitud: 

* Indicar su nombre, domicilio y correo electrónico para poder comunicarle la respuesta a su solicitud. \n
* Indicar los datos personales respecto de los que se busca ejercer alguno de los derechos. \n
* Anexar cualquier documento o información que facilite la localización de sus datos personales. \n
* Anexar copia del documento que acredite su identidad (credencial de elector, cédula profesional o pasaporte vigente). \n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nIKTAN Strategies dará respuesta a dicha solicitud en un plazo no mayor a 20 días por el mismo medio por el cual Usted haya realizado su solicitud, por medio de copias simples o electrónicamente, según sea el caso. En caso de que su solicitud se conteste de manera afirmativa o procedente, los cambios solicitados se harán en un plazo máximo de 15 días hábiles. \n
En caso de que Usted solicite el acceso a sus datos personales, IKTAN Strategies le informará mediante el correo electrónico en el que comuniquemos nuestra respuesta a su solicitud, el medio por el cual se le dará acceso a su información en caso de ser procedente. IKTAN Strategies podrá ampliar los plazos referidos en este párrafo, por una sola vez, por un periodo igual al original, lo cual le será informado.\n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'VII. MEDIOS PARA REVOCAR EL CONSENTIMIENTO PARA EL TRATAMIENTO DE DATOS PERSONALES',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nPara revocar su consentimiento para el tratamiento de sus datos personales, deberá presentar su solicitud enviando un correo electrónico a la siguiente dirección: contacto@iktanst.com. El usuario debe seguir el procedimiento que se describe en el numeral anterior. Si con posterioridad a la revocación, solicita la confirmación de la misma, IKTAN Strategies le responderá de forma expresa.\n
Le informamos que no en todos los casos podremos atender su solicitud o concluir el tratamiento de sus datos personales de forma inmediata, ya que es posible que por alguna obligación legal requiramos seguir tratando sus datos personales.\n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'VIII. OPCIONES PARA LIMITAR EL USO O DIVULGACIÓN DE SUS DATOS PERSONALES',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nPara limitar el uso o divulgación de sus datos personales, Usted deberá solicitarlo mediante solicitud debidamente firmada, presentada vía electrónica, solicitando la limitación del uso o divulgación de que se trate. Para efectos de lo anterior, deberá dirigirnos su respectiva solicitud por escrito, siguiendo el mismo procedimiento establecido en el presente Aviso de Privacidad para el ejercicio de los Derechos ARCO, requerimos una descripción clara y precisa de los datos respecto de los cuales busca limitar su uso y divulgación.\n
Recibido el escrito por el que nos indique que desea limitar el uso y divulgación de sus datos personales, tendremos 5 días hábiles para analizar, atender y enviarle la respuesta correspondiente. El medio por el cual le enviaremos nuestra respuesta, será aquel que nos sea indicado por usted en su solicitud, correo electrónico o, en su defecto, por el mismo medio por el cual nos hizo llegar su escrito.\n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'IX. ¿CÓMO PROTEGEMOS SU INFORMACIÓN PERSONAL?',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 20,
              color: AppTheme.primary,
            ),
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            ''' \nNos comprometemos a proteger su información personal y poner en práctica medidas de seguridad administrativas, técnicas y físicas adecuadas para protegerla contra todo tratamiento no autorizado o ilegal y contra cualquier pérdida, destrucción o daño accidentales. Estas medidas incluyen políticas, procedimientos, control de accesos físicos y elementos técnicos relacionados con los controles de acceso a la información.

El presente Aviso de Privacidad podrá ser modificado y/o ajustado, cualquier modificación le será notificada a Usted vía correo electrónico. Usted será el único responsable de verificar si se le ha notificado alguna modificación. Para los casos en los que su consentimiento sea necesario porque modifiquemos nuestra identidad, requiramos de usted más Datos Personales de los aquí mencionados, modifiquemos el fin del presente Aviso de Privacidad y/o cambien las condiciones de transferencia, de igual forma, le haremos llegar nuestro aviso correspondiente actualizado vía correo electrónico y se entenderá que usted acepta dicho Aviso de Privacidad hasta que no recibamos cualquier comunicación de usted en sentido contrario.

Por medio del presente usted acuerda y reconoce que el presente Aviso de Privacidad le será aplicable en todo momento. Asimismo, usted, en este acto, reconoce y acepta los términos y condiciones establecidos en el presente.\n''',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
            ),
            maxLines: 35,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Vigente a: Mon Dec 12 2023',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 15,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
