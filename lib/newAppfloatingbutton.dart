import 'package:flutter/material.dart';

class NewAppFloatingButton extends StatelessWidget {
  final Function onPressFunction;
  final IconData inputIcon;

  NewAppFloatingButton({@required this.inputIcon, @required this.onPressFunction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(inputIcon),
      onPressed: onPressFunction,
      elevation: 6,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 52, height: 52),
      fillColor: Color(0x994C4F5E),
    );
  }
}
