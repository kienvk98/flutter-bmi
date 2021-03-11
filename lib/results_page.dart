import 'package:auto_size_text/auto_size_text.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_button_text.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiValue;
  final String resultValue;
  final String interpretationValue;

  ResultPage({this.bmiValue, this.resultValue, this.interpretationValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 20,
                    child: AutoSizeText(
                      'Your Result',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      minFontSize: 1,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: activeCardColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Center(
                                child: AutoSizeText(
                                  'NORMAL',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF22d073),
                                  ),
                                  maxLines: 1,
                                  minFontSize: 1,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: AutoSizeText(
                                  bmiValue,
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  minFontSize: 1,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    resultValue,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF7e808a),
                                    ),
                                    maxLines: 1,
                                    minFontSize: 1,
                                  ),
                                  AutoSizeText(
                                    '18,5 - 25 kg/m2',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 1,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: AutoSizeText(
                                  interpretationValue,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  maxLines: 2,
                                  minFontSize: 1,
                                ),
                              ),
                            ),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constrains) {
                                  return Padding(
                                    padding: EdgeInsets.all(constrains.biggest.height/5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF181a2f),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: AutoSizeText(
                                          'SAVE RESULT',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomButtonText(
                onPress: (){
                  Navigator.pop(context, true);
                },
                text: 'RE-CALCULATOR YOUR BMI',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
