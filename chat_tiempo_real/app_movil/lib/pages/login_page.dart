import 'package:app_movil/widgets/custom_input.dart';
import 'package:app_movil/widgets/label.dart';
import 'package:app_movil/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Logo(),

            _Form(),

            Labels(),

            Text('Terminos y condiciones', style: TextStyle(fontWeight: FontWeight.w200),)
          ],
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

          RaisedButton(onPressed: (){
            print(emailCtrl.text);
          })
          //ElevatedButton(onPressed: null, child: Placeholder())
        ],
      ),
    );
  }
}

