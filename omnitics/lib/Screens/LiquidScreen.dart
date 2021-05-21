import 'package:flutter/material.dart';

class LiquidScreen extends StatefulWidget {
  @override
  _LiquidScreenState createState() => _LiquidScreenState();
}

class _LiquidScreenState extends State<LiquidScreen> {
  int yesBorderWidth = 0;
  int current = 0;
  @override
  void initState() {
    yesBorderWidth = 0;
    current = 0;
    super.initState();
  }

  void setSliderValue(double value, int index)
  {
    setState(() {
      current = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Widget> pages=
    [
      Container(height: screenHeight/ 2, width: screenWidth, color: Colors.orange,),
      Container(height: screenHeight/ 2, width: screenWidth, color: Colors.blue,),
      Container(height: screenHeight/ 2, width: screenWidth, color: Colors.white,),
      Container(height: screenHeight/ 2, width: screenWidth, color: Colors.red,),
    ];
    final List <Color> colorList = [Colors.white, Colors.grey, Colors.green];
    int index = 0;
    return Material(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.green,
        child: Center(child: Stack(
          children: <Widget>[
            Container(
            height: screenHeight/ 2,
            width: screenWidth,
            color: Colors.orange,
            child: AnimatedContainer(
              height: screenHeight / 2,
              width: screenWidth / 2,
              duration: Duration(seconds: 1),
              child: Column(
                children: [
                  AnimatedContainer(
                    height: 100,
                    width: screenWidth,
                    color: Colors.white,
                    duration: Duration(milliseconds: 5),
                    child: Material(
                      child: Center(child: Text("Yes")),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Transform.rotate(
                    angle: 3.15,
                    child: Slider(
                      value: current.toDouble(),
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      onChanged: (value)
                      {
                        setSliderValue(value, 4);
                        current = value.toInt();
                      },
                      min: 0,
                      max: screenWidth,
                      label: "Progress",
                    ),
                  ),
                  GestureDetector(
                    onTapDown:(value) =>{} ,
                    child: AnimatedContainer(
                      height: 100,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                          end: BorderSide(
                            width: current.toDouble(),
                            color: Colors.red,
                          ),
                        )
                      ),
                      duration: Duration(milliseconds: 5),
                        child: Center(child: Text("Noo")),
                      ),
                    ),
                ],
              ),
            )
          ),
            AnimatedContainer(
              height: current.toDouble()/10,
              width: current.toDouble(),
              color: Colors.black,
              duration: Duration(milliseconds: 5),
            ),
          ],
        )),
      ),
    );
  }
}

