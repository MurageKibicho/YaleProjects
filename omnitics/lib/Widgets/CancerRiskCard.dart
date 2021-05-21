import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/CancerRiskProvider.dart';
import 'package:provider/provider.dart';

class CancerRiskCard extends StatefulWidget {
  final double height;
  final double width;
  final double estimatedRisk;
  final double publicRisk;
  final String icon;
  final String bodyPart;
  final double screenPosition;
  final double popupPosition;

  const CancerRiskCard({Key key, this.height, this.width, this.estimatedRisk, this.icon, this.bodyPart, this.screenPosition, this.publicRisk, this.popupPosition}) : super(key: key);
  @override
  _CancerRiskCardState createState() => _CancerRiskCardState();
}

class _CancerRiskCardState extends State<CancerRiskCard> {
  @override
  Widget build(BuildContext context) {
    final CancerRisks = Provider.of<CancerRiskData>(context);
    return Material(
      child: GestureDetector(
        onTap: (){
          CancerRisks.setMenuOpen();
          CancerRisks.setScreenPosition(widget.popupPosition);
          CancerRisks.setBodyPart(widget.bodyPart);
          CancerRisks.setEstimatedRisk(widget.estimatedRisk);
          CancerRisks.setRiskCategory(setRiskCategory(widget.estimatedRisk));
          CancerRisks.setPublicRisk(widget.publicRisk);
          CancerRisks.setRiskColor(setColor(widget.estimatedRisk));
        },
        child: Container(
          height: widget.height,
          width: widget.width*0.99,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: widget.height*0.1,
                child: Container(
                  width: widget.width*.3,
                  height: widget.height*.4,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                      scale: 1.1,
                      child: Center(child: ImageIcon(AssetImage("${widget.icon}"),size: widget.height*0.4,color: Colors.black,))),
                ),
              ),
              Positioned.fill(
                top: widget.height*0.3,
                left: widget.width*0.3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: widget.height*0.4,
                    width: widget.width*.4,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                      value: widget.estimatedRisk,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Text("${widget.bodyPart}",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: widget.height*0.2,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Colors.black
                      ),),
                  ),
                ),
              ),
              Positioned(
                  top: widget.height*0.4,
                  left: widget.width*0.37,
                  child: Text("${widget.estimatedRisk.toStringAsFixed(2)}",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: widget.height*0.15,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.black
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color setColor(double value)
  {
    if (value > 0.8){return Colors.red;}
    else if (value > 0.6){return Colors.orange;}
    else if (value > 0.4 ){return Colors.amber;}
    else if (value > 0.2){return Colors.blueGrey;}
    else {return Colors.green;}
  }
  String setRiskCategory(double value)
  {
    if (value > 0.8){return "High";}
    else if (value > 0.6){return "Medium-high";}
    else if (value > 0.4){return "Medium";}
    else if (value > 0.2){return "Low-medium";}
    else {return "Low";}

  }
}
