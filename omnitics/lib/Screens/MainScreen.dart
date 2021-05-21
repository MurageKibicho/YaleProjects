import 'package:flutter/material.dart';
import 'package:omnitics/Widgets/ProgressBar.dart';
import 'package:omnitics/Widgets/YesNoCard.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Object female ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Omnitics",
            style: TextStyle(
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 500,
              width: 500,
            ),
          ],
        ),
      ),
    );
  }
}

