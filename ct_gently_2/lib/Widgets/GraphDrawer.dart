import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphDrawer extends StatefulWidget {
  final double graphHeight;
  final double graphWidth;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double optimumDoseValue;
  final double relativeRisk;

  const GraphDrawer({Key key, this.graphHeight, this.graphWidth, this.title, this.backgroundColor, this.textColor, this.optimumDoseValue, this.relativeRisk}) : super(key: key);

  @override
  _GraphDrawerState createState() => _GraphDrawerState();
}

class _GraphDrawerState extends State<GraphDrawer> {
  @override
  Widget build(BuildContext context) {
    var doseValue = widget.optimumDoseValue;
    if(doseValue < 0)
      {
        doseValue = 0;
      }
    return Container(
      height: widget.graphHeight,
      width: widget.graphWidth,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.title}",
              style: GoogleFonts.playfairDisplay(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: widget.textColor,
              ),),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Text("Organ dose",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: widget.textColor,
                    ),
                  ),
                  Text("${doseValue.toStringAsFixed(2)}",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      )),
                  Container(
                    height: widget.graphHeight * 0.7,
                    width: widget.graphWidth* 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: widget.graphHeight * 0.07*doseValue,
                        width: widget.graphWidth* 0.2,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.9),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Relative Risk",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: widget.textColor,
                    ),),
                  Text("${widget.relativeRisk.toStringAsFixed(3)}",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      )),
                  Container(
                    height: widget.graphHeight * 0.7,
                    width: widget.graphWidth* 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: widget.graphHeight * 0.17 * widget.relativeRisk,
                        width: widget.graphWidth* 0.2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5,),
          Container(
              height: widget.graphHeight*0.07,
              width: widget.graphWidth*0.9,
              decoration: BoxDecoration(
                color: widget.textColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(child: Text("More Information",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black.withOpacity(0.5),
                  ),),),),
        ],
      ),

    );
  }
}
