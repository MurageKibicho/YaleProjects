import 'package:ct_gently_2/Data/AbdomenEquationsProvider.dart';
import 'package:ct_gently_2/Data/ScreenSizeUtils.dart';
import 'package:ct_gently_2/Data/SettingsProvider.dart';
import 'package:ct_gently_2/Widgets/DataEntryHolder.dart';
import 'package:ct_gently_2/Widgets/DialogBoxWidget.dart';
import 'package:ct_gently_2/Widgets/GraphDrawer.dart';
import 'package:ct_gently_2/Widgets/ParameterBoxEntryHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ChartsRight.dart';
import 'package:sizer/sizer.dart';

class AbdomenScreen extends StatefulWidget {
  @override
  _AbdomenScreenState createState() => _AbdomenScreenState();
}

class _AbdomenScreenState extends State<AbdomenScreen> {

  var _value = 0.0;

  @override
  Widget build(BuildContext context) {
    final size16 = ScreenSizeUtils.blockSizeHorizontal*5;
    final Equations = Provider.of<AbdomenEquationsProvider>(context);
    final Settings = Provider.of<SettingsProvider>(context);
    double CTAbdomenOptimum = Equations.CTAbdomenOptimumDose();
    double CBCTAbdomenOptimum = Equations.CBCTOptimumAbdomenDose();
    
    double CTOptimummaleRisk = Equations.CTAbdomenMaleOptimumRisk();
    double CTOptimumfemaleRisk = Equations.CTAbdomenFemaleOptimumRisk();
    double CBCTOptimummaleRisk = Equations.CBCTMaleOptimumAbdomenRisk();
    double CBCTOptimumfemaleRisk = Equations.CBCTFemaleOptimumAbdomenRisk();

    double CTReferralDose  =Equations.CTAbdomenReferralDose();
    double CBCTReferralDose = Equations.CBCTReferralAbdomenDose();
    double CTmaleReferralRisk = Equations.CTAbdomenMaleReferralRisk();
    double CTfemaleReferralRisk = Equations.CTAbdomenFemaleReferralRisk();
    double CBCTmaleReferralRisk = Equations.CBCTMaleReferralAbdomenRisk();
    double CBCTfemaleReferralRisk = Equations.CBCTFemaleReferralAbdomenRisk();


    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 100.0.h,
          width: 100.0.w,
          child: Column(
            children: <Widget>[
              Row(children:<Widget> [
                ToggleButtons(
                  children: <Widget>[
                    Text("CT",
                      style: GoogleFonts.openSans(
                        fontSize:(Equations.isCTSelected[0]) ? 16.0.sp: 10.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text("CBCT",
                      style: GoogleFonts.openSans(
                        fontSize:(Equations.isCTSelected[1]) ? 16.0.sp: 10.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      Equations.setCTSelected(index);
                    });
                  },
                  isSelected: Equations.isCTSelected,
                ),
                Spacer(),
                Icon(Icons.settings,size: 3.0.h,),
                SizedBox(width: 8.0.w,),
                Icon(Icons.info, size: 3.0.h,),
                SizedBox(width: 4.0.w,),
              ],),
              SizedBox(height: 1.0.h,),
              Row(
                children:<Widget>[
                  DataEntryHolder(
                    height: 10.0.h,
                    width: 24.0.w,
                    fieldName: "Gender",
                    fieldNameFontSize: 17.0.sp,
                    displayValue: Equations.sex ? "Male" : "Female",
                    displayValueFontSize: 19.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.genderEntries,
                    scrollViewItemExtent: 40,
                    setValue: 0,
                  ),
                  DataEntryHolder(
                    height: 10.0.h,
                    width: 24.0.w,
                    fieldName: "Age",
                    fieldNameFontSize: 17.0.sp,
                    displayValue: Equations.age.toString(),
                    displayValueFontSize: 19.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.ageEntries,
                    scrollViewItemExtent: 40,
                    setValue: 1,
                  ),
                  DataEntryHolder(
                    height: 10.0.h,
                    width: 24.0.w,
                    fieldName: "Weight",
                    fieldNameFontSize: 17.0.sp,
                    displayValue: Equations.weight.toString() + " lb",
                    displayValueFontSize: 19.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.weightEntries,
                    scrollViewItemExtent: 40,
                    setValue: 2,
                  ),
                  DataEntryHolder(
                    height: 10.0.h,
                    width: 24.0.w,
                    fieldName: "Circum",
                    fieldNameFontSize: 17.0.sp,
                    displayValue: Equations.circumference.toString() + " cm",
                    displayValueFontSize: 19.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.lungCircumferenceEntries,
                    scrollViewItemExtent: 40,
                    setValue: 3,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width:3.0.w),
                  Text("Optimization",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  Spacer(),
                  Text("Reference",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  SizedBox(width: 10.0.w),
                ],
              ),
              Row(
                children:<Widget> [
                  Container(
                    color: Colors.white,
                    height: 8.0.h,
                    width: 25.0.w,
                    child: Column(
                      children:<Widget>[
                        Text("mAs",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),),
                        Text(Equations.isCTSelected[0] ?
                        Equations.CTAbdomenOptimumMASCalc().toInt().toString()
                            :
                        Equations.CBCTAbdomenOptimumMASCalc().toInt().toString(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 8.0.h,
                    width: 25.0.w,
                    child: Column(
                      children:<Widget>[
                        Text("kVp",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),),
                        Text(Equations.isCTSelected[0] ?
                        Equations.CTAbdomenOptimumKVPCalc().toInt().toString()
                            :
                        Equations.CBCTAbdomenOptimumKVPCalc().toInt().toString()
                          ,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),),
                      ],
                    ),
                  ),
                  ParameterBoxEntryHolder(
                    height: 8.0.h,
                    width: 25.0.w,
                    fieldName: "mAs",
                    fieldNameFontSize: 12.0.sp,
                    displayValue: Equations.refmAs.toString(),
                    displayValueFontSize: 16.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.mAsEntries,
                    scrollViewItemExtent: 40,
                    setValue: 4,
                  ),
                  ParameterBoxEntryHolder(
                    height: 8.0.h,
                    width: 25.0.w,
                    fieldName: "kVp",
                    fieldNameFontSize: 12.0.sp,
                    displayValue: Equations.refkVp.toString(),
                    displayValueFontSize: 16.0.sp,
                    scrollHeight: 8.5.h,
                    scrollWidth: 40.0.w,
                    scrollChild: Equations.kVpEntries,
                    scrollViewItemExtent: 40,
                    setValue: 5,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget>[
                  Text("Red Bone Marrow",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size16,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF676666),
                    ),
                  ),
                  Text("Red Bone Marrow",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size16,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF676666),
                    ),),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 2.0.w,),
                  GraphDrawer(
                    graphHeight: 44.0.h,
                    graphWidth: 45.0.w,
                    backgroundColor: Color(0xFF655FB4).withOpacity(0.9),
                    title: "Optimization",
                    textColor: Colors.white70,
                    optimumDoseValue: Equations.isCTSelected[0]? CTAbdomenOptimum: CBCTAbdomenOptimum,
                    relativeRisk: Equations.isCTSelected[0] ?
                    Equations.sex ? CTOptimummaleRisk : CTOptimumfemaleRisk
                        :
                    Equations.sex ? CBCTOptimummaleRisk : CBCTOptimumfemaleRisk
                  ),
                  SizedBox(width: 1.0.w,),
                  GraphDrawer(
                    graphHeight: 44.0.h,
                    graphWidth: 45.0.w,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    title: "Reference",
                    textColor: Color(0xFF655FB4),
                    optimumDoseValue: Equations.isCTSelected[0]? CTReferralDose: CBCTReferralDose,
                    relativeRisk: Equations.isCTSelected[0] ?
                    Equations.sex ? CTmaleReferralRisk : CTfemaleReferralRisk
                      :
                    Equations.sex ? CBCTmaleReferralRisk : CBCTfemaleReferralRisk
                  ),
                  SizedBox(width: 2.0.w,),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: Settings.isDialogBoxOpen,
          child: Container(
            height: 100.0.h,
            width: 100.0.w,
            color: Colors.black.withOpacity(0.5),
            child: DialogBoxWidget
              (
              screen: 2,
              height: 27.0.h,
              width: 75.5.w,
              title: Settings.dialogBoxTitle,
              titleFontSize: 14.0.sp,
              scrollWidth: Settings.scrollWidth,
              scrollHeight: Settings.scrollHeight,
              scrollViewItemExtent: Settings.scrollViewItemsExtent,
              scrollChild: Settings.listScrollView,
              setValue: Settings.setValue,
            ),
          ),
        ),

      ],
    );
  }
}