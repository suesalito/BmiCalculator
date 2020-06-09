import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtomButton extends StatelessWidget {
  // const ButtomButton({
  //   Key key,
  // }) : super(key: key);

  final Function ontab;
  final String buttonTitle;

  ButtomButton({@required this.ontab, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )),
        color: kButtomBarColor,
        margin: EdgeInsets.all(2),
        //decoration: BoxDecoration(color: buttomBarColor, borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        height: kButtomContainerHeight,
      ),
    );
  }
}
