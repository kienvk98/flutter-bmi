import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:seekbar/seekbar.dart';

import 'constants.dart';
import 'input_page.dart';

class SetHeightWidget extends StatefulWidget {

  int height;
  ValueChanged<double> onProgressChange;

  SetHeightWidget({this.height, this.onProgressChange});

  @override
  _SetHeightWidgetState createState() => _SetHeightWidgetState();
}

class _SetHeightWidgetState extends State<SetHeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: inActiveCardColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: AutoSizeText(
                "HEIGHT",
                style: TextStyle(
                  color: Color(0xFF8d8e98),
                  fontSize: 20,
                ),
                minFontSize: 1,
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  AutoSizeText(
                    '${widget.height}',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 1,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "cm",
                    style: TextStyle(
                      color: Color(0xFF8d8e98),
                      fontSize: 20,
                    ),
                    minFontSize: 1,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.biggest.height / 2 < 20) {
                    return SeekBar(
                      value: 0.5,
                      thumbColor: Color(0xFFeb1555),
                      progressWidth: 4,
                      thumbRadius: constraints.biggest.height / 2,
                    );
                  } else {
                    return SeekBar(
                      onProgressChanged: (value){
                        widget.onProgressChange(value);
                      },
                      value: widget.height/200,
                      thumbColor: Color(0xFFeb1555),
                      progressWidth: 4,
                      thumbRadius: 20,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
