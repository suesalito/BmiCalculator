import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'constants.dart';

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
    return selectedGender == genderInput ? kActiveColor : kInactiveColor;
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

  int height = 180;
  int weight = 60;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            child: ReusableCard(
              bgColor: kActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kWordStyle,
                    //textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        textAlign: TextAlign.center,
                        style: kUnitStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'CM',
                        textAlign: TextAlign.center,

                        //style: kUnitStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x26EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          print(newValue);
                          height = newValue.round(); // toint() will always round down
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ), // middle box
          Expanded(
            child: Row(
              // lower row
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    bgColor: kActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kWordStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kUnitStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AppFloatButton(
                              inputIcon: Icons.add,
                              pressFunction: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppFloatButton(
                              inputIcon: Icons.edit,
                              pressFunction: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(bgColor: kActiveColor),
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
            color: kButtomBarColor,
            margin: EdgeInsets.all(5),
            //decoration: BoxDecoration(color: buttomBarColor, borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            height: kButtomContainerHeight,
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class AppFloatButton extends StatelessWidget {
  // const AppFloatButton({
  //   Key key,
  // }) : super(key: key);
  final Function pressFunction;
  final IconData inputIcon;

  AppFloatButton({this.inputIcon, this.pressFunction});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Color(0xFF4C4F5E),
      child: Icon(
        inputIcon,
        color: Colors.white,
      ),
      onPressed: pressFunction,
    );
  }
}
