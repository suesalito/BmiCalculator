import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';

const double buttomContainerHeight = 80.0;
const activeColor = Color(0xFF1A1E33);
const inactiveColor = Color(0xFF111328);
const buttomBarColor = Colors.pink;

enum Gender { male, female }

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
  // Color maleButton = inactiveColor;
  // Color femaleButton = inactiveColor;

  // void updateColor(Gender genderInput) {
  //   if (genderInput == Gender.male) {
  //     // male is pressed.
  //     if (maleButton == inactiveColor) {
  //       maleButton = activeColor;
  //       femaleButton = inactiveColor;
  //     } else {
  //       maleButton = inactiveColor;
  //     }
  //   } else if (genderInput == Gender.female) {
  //     // female is pressed.
  //     if (femaleButton == inactiveColor) {
  //       femaleButton = activeColor;
  //       maleButton = inactiveColor;
  //     } else {
  //       femaleButton = inactiveColor;
  //     }
  //   }
  // }

  Gender selectedGender; // make the male and female inactive at the beginning.

  Color activeColorCheck(Gender genderInput) {
    return selectedGender == genderInput ? activeColor : inactiveColor;
  }

  selectMale() {
    print('tab on function selectMale.');
    setState(() {
      selectedGender = Gender.male;
    });
  }

  selectFemale() {
    print('tab on function select Female.');
    setState(() {
      selectedGender = Gender.female;
    });
  }

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
                    bgColor: activeColorCheck(Gender.male),
                    childWidget: IconContent(FontAwesomeIcons.mars, 'MALE'),
                    // you may send the predefine function like this or user anonymous function.
                    // as you can see in female object down below.
                    onPress: selectMale,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: activeColorCheck(Gender.female),
                    childWidget: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
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
