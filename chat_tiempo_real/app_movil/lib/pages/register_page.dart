import 'package:app_movil/helpers/mostrar_alerta.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:app_movil/widgets/boton_azul.dart';
import 'package:app_movil/widgets/custom_input.dart';
import 'package:app_movil/widgets/label.dart';
import 'package:app_movil/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(titulo: 'Registro',),

                  _Form(),

                  Labels(titulo: "¿Ya tienes una cuenta?", subtitulo: "Ingresa ahora!", ruta: 'login',),

                  Text('Terminos y condiciones', style: TextStyle(fontWeight: FontWeight.w200),)
                ],
              ),
            ),
          ),
        )
    );
  }
}


class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),

          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
              icon: Icons.lock_clock_outlined,
              placeholder: 'Contraseña',
              textController: passCtrl
          ),

          BotonAzul(
              text: 'Crear cuenta',
              callback: authService.autenticando
                  ? () => {}
                  : () async {
                print(emailCtrl.text);
                print(passCtrl.text);

                final registroOk = await authService.register(nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());

                if(registroOk == true){
                  Navigator.pushReplacementNamed(context, 'usuarios');
                }else{
                    mostrarAlerta(context, 'Registro incorrecto', registroOk);
                }
              }
          )
          //ElevatedButton(onPressed: null, child: Placeholder())
        ],
      ),
    );
  }
}

