import 'package:flutter/material.dart';

const wordstyle = TextStyle(fontSize: 25, color: Color(0xFF8D8E98));

class IconContent extends StatelessWidget {
  // const IconContent({
  //   Key key,
  // }) : super(key: key);
  final IconData icon;
  final String word;
  IconContent(this.icon, this.word);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          word,
          style: wordstyle,
        )
      ],
    );
  }
}
