import 'package:flutter/material.dart';

class ContainerBody extends StatelessWidget {

  final List<Widget> children;

  const ContainerBody({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ]
          ),

          child: ListView(
            children: this.children,
          ),
        )
    );
  }
}
