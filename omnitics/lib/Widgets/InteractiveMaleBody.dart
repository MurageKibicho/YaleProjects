import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/Widgets/CustomTextBox.dart';
import 'package:provider/provider.dart';
import '../SurveyData/CancerRiskProvider.dart';
import 'package:sizer/sizer.dart';


class InteractiveMaleBody extends StatefulWidget {
  @override
  _InteractiveMaleBodyState createState() => _InteractiveMaleBodyState();
}

class _InteractiveMaleBodyState extends State<InteractiveMaleBody> {
  Offset menuOffset;


  @override
  Widget build(BuildContext context) {
    final fontSize = 8.0.sp;
    return Container(
      color: Colors.white,
      child: Stack(
          children:<Widget>[
            Container(
              width: 50.0.w,
                height: 650,
                child: Image.asset("Assets/male/malePng.png",color: Colors.black,fit: BoxFit.fitHeight,)),
            CustomTextBox(fontSize: fontSize,left: 20.4.w,top:0.3.h, bodyPart: "Glioma", estimatedRisk: 1.00, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 20.4.w,top:2.0.h, bodyPart: "Head and Neck", estimatedRisk: 0.95, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 20.7.w,top:5.2.h, bodyPart: "Thyroid", estimatedRisk: 0.90, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 24.5.w,top:8.5.h, bodyPart: "Male Breast", estimatedRisk: 0.85, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 16.5.w,top:8.5.h, bodyPart: "Lung", estimatedRisk: 0.80, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 16.5.w,top:11.0.h, bodyPart: "Liver", estimatedRisk: 0.75, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 24.5.w,top:11.0.h, bodyPart: "Pancreas", estimatedRisk: 0.70, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 25.0.w,top:14.4.h, bodyPart: "Upper GI", estimatedRisk: 0.65, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 20.7.w,top:15.5.h, bodyPart: "Colorectal", estimatedRisk: 0.60, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 16.5.w,top:17.0.h, bodyPart: "Renal", estimatedRisk: 0.55, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 24.5.w,top:17.0.h, bodyPart: "Bladder", estimatedRisk: 0.50, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 24.5.w,top:18.5.h, bodyPart: "Prostate", estimatedRisk: 0.45, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 16.0.w,top:22.0.h, bodyPart: "Melanoma", estimatedRisk: 0.40, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 24.0.w,top:22.0.h, bodyPart: "Hematopoeitic", estimatedRisk: 0.35, publicRisk:0.1, popupPosition: 100,),
            CustomTextBox(fontSize: fontSize,left: 16.0.w,top:14.4.h, bodyPart: "Billiary", estimatedRisk: 0.1, publicRisk:0.1, popupPosition: 100,),

           // CustomTextBox(left: screenWidth / 2 - 37,top:30, value: 0.88, globalKey: _globalKey15,),

          ]),
    );
  }


}


