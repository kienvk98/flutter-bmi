
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class SexWidget extends StatefulWidget {
  String sex;
  String icon;
  Color color;

  SexWidget({this.sex, this.icon, this.color});

  @override
  _SexWidgetState createState() => _SexWidgetState();
}

class _SexWidgetState extends State<SexWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 4,
            child: Image(
              image: AssetImage('images/${widget.icon}'),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Center(
            child: AutoSizeText(
              widget.sex,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
              minFontSize: 1,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}