import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';



class ValueWidget extends StatefulWidget {
  String text;
  int value;
  Function onMinus;
  Function onPlus;

  ValueWidget({this.text, this.value, this.onMinus, this.onPlus});

  @override
  _ValueWidgetState createState() => _ValueWidgetState();
}

class _ValueWidgetState extends State<ValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: inActiveCardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: AutoSizeText(
                    widget.text,
                    style: TextStyle(
                      color: Color(0xFF8d8e98),
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    minFontSize: 1,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: AutoSizeText(
                    '${widget.value}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 1,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          widget.onMinus();
                        },
                        color: Color(0xFF1c1f32),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              child: LayoutBuilder(builder: (
                                  context,
                                  constraint,
                                  ) {
                                return Icon(
                                  Icons.remove,
                                  size: constraint.biggest.height,
                                );
                              }),
                            ),
                            Expanded(
                              child: SizedBox(),
                            )
                          ],
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          widget.onPlus();
                        },
                        color: Color(0xFF1c1f32),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: LayoutBuilder(builder: (
                                  context,
                                  constraint,
                                  ) {
                                return Icon(
                                  Icons.add,
                                  size: constraint.biggest.height,
                                );
                              }),
                            ),
                            Expanded(
                              child: SizedBox(),
                            )
                          ],
                        ),
                        shape: CircleBorder(),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}