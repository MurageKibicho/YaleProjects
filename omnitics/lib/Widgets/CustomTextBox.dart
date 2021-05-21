import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../SurveyData/CancerRiskProvider.dart';

class CustomTextBox extends StatefulWidget {
  final double left;
  final double top;
  final double fontSize;
  final GlobalKey globalKey;
  final String bodyPart;
  final String riskCategory;
  final double publicRisk;
  final double estimatedRisk;
  final double popupPosition;

  const CustomTextBox({Key key, this.left, this.top, this.globalKey, this.bodyPart, this.riskCategory, this.publicRisk, this.estimatedRisk, this.popupPosition, this.fontSize}) : super(key: key);
  @override
  _CustomTextBoxState createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    final CancerRisks = Provider.of<CancerRiskData>(context);

    return Positioned(
        left: widget.left,
        top: widget.top,
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
          child: Text("${widget.estimatedRisk.toStringAsFixed(2)}",
            style: GoogleFonts.sourceSansPro(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: setColor(widget.estimatedRisk).withOpacity(0.6)
            ),),
        ));
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
