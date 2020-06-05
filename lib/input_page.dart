import 'package:flutter/material.dart';

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
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(),
          ), // middle box
          Expanded(
            child: Row(
              // lower row
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Color(0xFF1A1E33), borderRadius: BorderRadius.circular(15)),
    );
  }
}
