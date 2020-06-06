import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // No need to use for this app.
  // const ReusableCard({
  //   Key key,
  // }) : super(key: key);
  final Color bgColor;
  final Widget childWidget;
  final Function onPress;
  ReusableCard({@required this.bgColor, this.childWidget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
