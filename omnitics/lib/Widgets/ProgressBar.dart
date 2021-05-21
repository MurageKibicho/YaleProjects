import 'package:flutter/material.dart';
class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: Column(
        children: [
          Text("10 out of 47"),
          LinearProgressIndicator(
           value: 0.5,
          ),
        ],
      ),
    );
  }
}
