import 'package:flutter/material.dart';
import 'package:omnitics/Widgets/InteractiveGraph.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: Center(
            child: InteractiveGraph(),
          ),
        )
    );
  }
}
