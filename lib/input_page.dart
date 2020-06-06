import 'package:flutter/material.dart';

const double buttomContainerHeight = 80.0;
const activeColor = Color(0xFF1A1E33);

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
                  child: ReusableCard(bgColor: activeColor),
                ),
                Expanded(
                  child: ReusableCard(bgColor: activeColor),
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
            color: Colors.pink,
            margin: EdgeInsets.all(10),
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

class ReusableCard extends StatelessWidget {
  // No need to use for this app.
  // const ReusableCard({
  //   Key key,
  // }) : super(key: key);
  final Color bgColor;
  ReusableCard({@required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(15)),
    );
  }
}
