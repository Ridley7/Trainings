import 'package:app_movil/helpers/mostrar_alerta.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:app_movil/widgets/boton_azul.dart';
import 'package:app_movil/widgets/custom_input.dart';
import 'package:app_movil/widgets/label.dart';
import 'package:app_movil/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                Logo(titulo: "Messenger"),

                _Form(),

                Labels(titulo: "¿No tienes cuenta?", subtitulo: "Crea una ahora", ruta: 'register',),

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
              text: 'Ingrese',
              callback: authService.autenticando
                  ? () => {}
                  :() async {

                print("flaf");

                //Ocultamos el teclado por que nos estorba
                FocusScope.of(context).unfocus();
                final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

                print("Aqui entro");
                Navigator.pushReplacementNamed(context, 'usuarios');

                if(loginOk){

                }else{
                  //Mostramos alerta
                  mostrarAlerta(context, 'Login Incorrecto', 'Revise sus credenciales');
                  print("Aqui tambien");
                }

              }
          )
          //ElevatedButton(onPressed: null, child: Placeholder())
        ],
      ),
    );
  }
}

