import 'package:auto_size_text/auto_size_text.dart';
import 'package:bmi_calculator/model/bmi_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/set_height_widget.dart';
import 'package:bmi_calculator/sex_widget.dart';
import 'package:bmi_calculator/value_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_button_text.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool selectMale = true;
  int heightValue = 150;
  int weightValue = 60;
  int ageValue = 20;

  void selectSex(SexType sexType) {
    if (sexType == SexType.Male) {
      selectMale = true;
    } else {
      selectMale = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  ReusableCard(
                    child: SexWidget(
                      sex: "Male",
                      icon: "malegender.png",
                      color: selectMale == true
                          ? activeCardColor
                          : inActiveCardColor,
                    ),
                    onTap: () {
                      setState(() {
                        selectSex(SexType.Male);
                      });
                    },
                  ),
                  ReusableCard(
                    child: SexWidget(
                      sex: "Female",
                      icon: "female-sign.png",
                      color: selectMale == true
                          ? inActiveCardColor
                          : activeCardColor,
                    ),
                    onTap: () {
                      setState(() {
                        selectSex(SexType.Female);
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SetHeightWidget(
                  height: heightValue,
                  onProgressChange: (value){
                    setState(() {
                      heightValue = (200 * value).toInt();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  ReusableCard(
                    child: ValueWidget(
                      text: "WEIGHT",
                      value: weightValue,
                      onMinus: (){
                        setState(() {
                          weightValue--;
                        });
                      },
                      onPlus: (){
                        setState(() {
                          weightValue++;
                        });
                      },
                    ),
                  ),
                  ReusableCard(
                    child: ValueWidget(
                      text: "AGE",
                      value: ageValue,
                      onMinus: (){
                        setState(() {
                          ageValue--;
                        });
                      },
                      onPlus: (){
                        setState(() {
                          ageValue++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomButtonText(
                text: "CALCULATE YOUR BMI",
                onPress: () {
                  BMIBrain bmi =
                      BMIBrain(weight: weightValue.toDouble(), height: heightValue.toDouble());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiValue: bmi.calculatorBMI(),
                        resultValue: bmi.getResult(),
                        interpretationValue: bmi.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum SexType {
  Male,
  Female,
}
