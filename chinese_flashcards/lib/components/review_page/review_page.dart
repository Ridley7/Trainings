import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required this.title,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: callback, child: Text(title),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor
            ),
          ),
        ));
  }
}
