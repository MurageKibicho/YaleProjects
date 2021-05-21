import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/CancerRiskProvider.dart';
import 'package:omnitics/Widgets/CancerInformationCard.dart';
import 'package:omnitics/Widgets/CancerRiskCard.dart';
import 'package:omnitics/Widgets/InteractiveMaleBody.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BodyScreen extends StatefulWidget {
  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    final CancerRisks = Provider.of<CancerRiskData>(context);
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.5.h,),
          Padding(
            padding: EdgeInsets.all(0.5.w),
            child: Text("Your Results",
              style: GoogleFonts.raleway(
                  fontSize: 32.0.sp,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  color: Colors.black
              ),),
          ),

          Padding(
            padding: EdgeInsets.only(left: 3.0.w),
            child: Text("Are Ready!",
              style: GoogleFonts.sourceSansPro(
                  fontSize: 32.0.sp,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.normal,
                  color: Colors.black
              ),),
          ),
          SizedBox(height: 1.0.h,),
          Container(
            height: 2,
            width:100.0.w,
            color: Colors.black,),
          SizedBox(height: 1.0.h,),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.0.h,
                          width: 50.0.w,
                          child: InteractiveMaleBody()
                      ),
                      Row(
                        children: [
                          CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.45,bodyPart: "Prostate", icon: "Assets/icons/prostate.png",popupPosition: 100,),
                          CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.4,bodyPart: "Melanoma", icon: "Assets/icons/melanoma.png",popupPosition: 100,),
                        ],
                      ),
                      Row(
                        children: [
                          CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.35,bodyPart: "Hemato-", icon: "Assets/icons/cells.png",popupPosition: 100,),
                          CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.1,bodyPart: "Billiary", icon: "Assets/icons/billiary.png",popupPosition: 100,),
                        ],
                      ),
                      Row(
                        children: [
                          CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.5,bodyPart: "Bladder", icon: "Assets/icons/bladder.png",popupPosition: 100,),
                          Text("Highest Risk \n: Glioma")
                        ],
                      ),

                    ],
                  ),
                  Container(
                      height: 70.0.h,
                      width: 50.0.w,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 1.0,bodyPart: "Glioma", icon: "Assets/icons/brain.png",popupPosition: 150,),
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.95,bodyPart: "Head", icon: "Assets/icons/head.png",popupPosition: 150,),

                            ],
                          ),
                          Row(
                            children: [
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.9,bodyPart: "Thyroid", icon: "Assets/icons/thyroid.png",popupPosition: 250,),
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.85,bodyPart: "Breast", icon: "Assets/icons/chest.png",popupPosition: 250,),
                            ],
                          ),
                          Row(
                            children: [
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.75,bodyPart: "Liver", icon: "Assets/icons/liver.png",popupPosition: 300,),
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.8,bodyPart: "Lung", icon: "Assets/icons/lungs.png",popupPosition: 300,),
                            ],
                          ),
                          Row(
                            children: [
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.7,bodyPart: "Pancreas", icon: "Assets/icons/pancreas.png",popupPosition: 10,),
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.65,bodyPart: "Upper GI", icon: "Assets/icons/upperGI.png",popupPosition: 10,),
                            ],
                          ),
                          Row(
                            children: [
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.6,bodyPart: "Colorectal", icon: "Assets/icons/intestine.png",popupPosition: 100,),
                              CancerRiskCard(height: 10.0.h, width: 23.0.w,estimatedRisk: 0.55,bodyPart: "Renal", icon: "Assets/icons/kidney.png",popupPosition: 100,),
                            ],
                          ),
                          Container(
                            height: 19.5.h,
                            width: 50.0.w,
                            child: Column(
                              children:<Widget>[
                                Text("Risk Color",
                                  style:  GoogleFonts.sourceSansPro(
                                      fontSize: 10.0.sp,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black
                                  ),),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(1.0.h),
                                      child: Container(
                                        height: 1.0.h,
                                        width: 1.0.h,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("High",
                                      style:  GoogleFonts.sourceSansPro(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(1.0.h),
                                      child: Container(
                                        height: 1.0.h,
                                        width: 1.0.h,
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("Medium-High",
                                      style:  GoogleFonts.sourceSansPro(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(1.0.h),
                                      child: Container(
                                        height: 1.0.h,
                                        width: 1.0.h,
                                        decoration: BoxDecoration(
                                            color: Colors.amberAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("Medium ",
                                      style:  GoogleFonts.sourceSansPro(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(1.0.h),
                                      child: Container(
                                        height: 1.0.h,
                                        width: 1.0.h,
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("Low-Medium",
                                      style:  GoogleFonts.sourceSansPro(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:  EdgeInsets.all(1.0.h),
                                      child: Container(
                                        height: 1.0.h,
                                        width: 1.0.h,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("Low",
                                      style:  GoogleFonts.sourceSansPro(
                                          fontSize: 13.0.sp,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
              Positioned(
                top: CancerRisks.screenPosition,
                child: Visibility(
                    visible: CancerRisks.isMenuOpen,
                    child: CancerInformationCard(
                      estimatedRisk: CancerRisks.estimatedRisk,
                      bodyPartName: CancerRisks.bodyPart,
                      averagePublicRisk: CancerRisks.publicRisk,
                      riskCategory: CancerRisks.riskCategory,
                      riskColor: CancerRisks.riskColor,

                    )),
              ),
              Visibility(
                visible: CancerRisks.isMenuOpen,
                child: GestureDetector(
                  onTap: ()
                  {
                    CancerRisks.setMenuOpen();
                  },
                  child: Container(
                    height: 70.0.h,
                    width: 100.0.w,
                    color: Colors.transparent,

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
