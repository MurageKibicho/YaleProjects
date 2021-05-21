import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancerInformationCard extends StatefulWidget {
  final double estimatedRisk;
  final String riskCategory;
  final String bodyPartName;
  final double averagePublicRisk;
  final Color riskColor;

  const CancerInformationCard({Key key, this.estimatedRisk, this.riskCategory, this.bodyPartName, this.averagePublicRisk, this.riskColor}) : super(key: key);
  @override
  _CancerInformationCardState createState() => _CancerInformationCardState();
}


class _CancerInformationCardState extends State<CancerInformationCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
      height: 250,
      width: 300,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.black.withOpacity(0.8),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Risk Information",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.normal,
                      color: Colors.white
                  ),),
              ],
            ),
            SizedBox(height: 8,),
            Container(
              height: 1,
              width:300,
              color: Colors.white,),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${widget.bodyPartName} risk estimated at ${widget.estimatedRisk}",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Colors.white
                ),),
            ),
            Center(
              child: Text("${widget.riskCategory} Risk",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: widget.riskColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("The average ${widget.bodyPartName.toLowerCase()} risk is\n ${widget.estimatedRisk/2} for the general public",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Colors.white
                ),),
            ),
            Container(
              height: 1,
              width:300,
              color: Colors.white,),
          ],
        ),
      ),
    );
  }
}