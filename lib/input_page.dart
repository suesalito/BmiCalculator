import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double buttomContainerHeight = 80.0;
const activeColor = Color(0xFF1A1E33);
const buttomBarColor = Colors.pink;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

// comment because using extract feature of Dart instead.!!
// Container mainContainer() {
//   return Container(
//     margin: EdgeInsets.all(12),
//     decoration: BoxDecoration(color: Color(0xFF1A1E33), borderRadius: BorderRadius.circular(15)),
//   );
// }

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              // top row
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    bgColor: activeColor,
                    childWidget: IconContent(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: activeColor,
                    childWidget: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(bgColor: activeColor),
          ), // middle box
          Expanded(
            child: Row(
              // lower row
              children: <Widget>[
                Expanded(
                  child: ReusableCard(bgColor: activeColor),
                ),
                Expanded(
                  child: ReusableCard(bgColor: activeColor),
                )
              ],
            ),
          ),
          Container(
            child: Center(
                child: Text(
              'Calculate BMI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
            color: buttomBarColor,
            margin: EdgeInsets.all(5),
            //decoration: BoxDecoration(color: buttomBarColor, borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            height: buttomContainerHeight,
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class IconContent extends StatelessWidget {
  // const IconContent({
  //   Key key,
  // }) : super(key: key);
  IconData icon;
  String word;
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
          style: TextStyle(fontSize: 25, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  // No need to use for this app.
  // const ReusableCard({
  //   Key key,
  // }) : super(key: key);
  final Color bgColor;
  final Widget childWidget;
  ReusableCard({@required this.bgColor, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
    );
  }
}
