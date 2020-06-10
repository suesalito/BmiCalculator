import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/Buttombutton.dart';
import 'package:bmi_calculator/Components/newAppfloatingbutton.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/Screens/result.dart';

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
  int age = 18;

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
                            // comment since AppFloatButton(from FloatingActionButton cannot be used
                            // more than once in the app follow by DArt team comment
                            // https://api.flutter.dev/flutter/material/FloatingActionButton-class.html)
                            // so beacuse of that we will create the appbutton from RawMaterialButton which
                            // is the widget that used to create the Floating action, but we will only specific
                            // something that need to be used.
                            // AppFloatButton(
                            //   inputIcon: Icons.add,
                            //   pressFunction: () {
                            //     setState(() {
                            //       weight++;
                            //     });
                            //   },
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // AppFloatButton(
                            //   inputIcon: Icons.edit,
                            //   pressFunction: () {
                            //     setState(() {
                            //       weight--;
                            //     });
                            //   },
                            // )
                            NewAppFloatingButton(
                              inputIcon: FontAwesomeIcons.minus,
                              onPressFunction: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 16,
                            ),

                            NewAppFloatingButton(
                              inputIcon: FontAwesomeIcons.plus,
                              onPressFunction: () {
                                setState(() {
                                  weight++;
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
                  child: ReusableCard(
                    bgColor: kActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kWordStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kUnitStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            NewAppFloatingButton(
                              inputIcon: FontAwesomeIcons.minus,
                              onPressFunction: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            NewAppFloatingButton(
                              inputIcon: FontAwesomeIcons.plus,
                              onPressFunction: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ButtomButton(
            ontab: () {
              Calculator calc = Calculator(weight: weight, height: height);

              // for the normal navigator push method.
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ResultPage(
              //       bmiResult: calc.getResult(),
              //       bmiScore: calc.calculateBMI(),
              //       bmiComment: calc.getInterpretation(),
              //     ),
              //   ),
              // );
              Navigator.pushNamed(context, '/first',
                  arguments: ResultPage(
                    bmiScore: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                    bmiComment: calc.getInterpretation(),
                  ));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

// no use because the Dart team comment that FloatingActionButton can be use once in one screen.
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
