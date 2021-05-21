import 'package:ct_gently_2/Data/AbdomenEquationsProvider.dart';
import 'package:ct_gently_2/Data/ChestEquationsProvider.dart';
import 'package:ct_gently_2/Data/ScreenSizeUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Charts.dart';
import 'ChartsRight.dart';


class AbdomenScreen1 extends StatefulWidget {
  @override
  _AbdomenScreen1State createState() => _AbdomenScreen1State();
}

class _AbdomenScreen1State extends State<AbdomenScreen1> {

  int _selectedItemIndex = 0;
  var _value = 0.0;



  @override
  Widget build(BuildContext context) {
    ScreenSizeUtils().init(context);
    final size21 = ScreenSizeUtils.blockSizeHorizontal*5.7;
    final size10 = ScreenSizeUtils.blockSizeVertical*1;
    final size18 = ScreenSizeUtils.blockSizeHorizontal*4;
    final size16 = ScreenSizeUtils.blockSizeHorizontal*5;
    final size100 = ScreenSizeUtils.blockSizeVertical*10;
    final size300 = ScreenSizeUtils.blockSizeVertical*44;
    final size50 = ScreenSizeUtils.blockSizeHorizontal*18.5;
    final size80 = ScreenSizeUtils.blockSizeVertical*8;
    final Equations = Provider.of<AbdomenEquationsProvider>(context);

    return Container(
      color: Equations.isCTSelected[0] ? Colors.white10 : Colors.white ,
      height: ScreenSizeUtils.blockSizeVertical*100,
      width: ScreenSizeUtils.blockSizeHorizontal*100,
      child: Column(
        children: <Widget>[
          Row(children:<Widget> [
            ToggleButtons(
              children: <Widget>[
                Text("CT",
                  style: GoogleFonts.openSans(
                    fontSize: size21,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text("CBCT",
                  style: GoogleFonts.openSans(
                    fontSize: size21,
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
            GestureDetector(
                onTap:() => DialogUtils.showCustomDialog(context, title: "Disclaimer", okBtnFunction: null,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.white,
                    child: Center(
                      child: Text("This product is for reference only,"
                          "And not intended for any clinical applications."
                          "The developers will not be responsible legally "
                          "or financially for any consequence as a result of "
                          "using this product",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )
                      ),
                    ),
                  ),),
                child: Icon(Icons.settings)),
            SizedBox(width: size21,),
            Icon(Icons.info),
            SizedBox(width: size21,),
          ],),
          SizedBox(height: ScreenSizeUtils.blockSizeVertical*0.5,),
          Row(
            children:<Widget>[
              Container(
                height: size100,
                width: ScreenSizeUtils.blockSizeHorizontal*26,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Text("Gender",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size21,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  GestureDetector(
                    onTap:() => DialogUtils.showCustomDialog(context, title: "Gender", okBtnFunction: null,
                      child: Container(
                        height: ScreenSizeUtils.blockSizeVertical*10,
                        width: ScreenSizeUtils.blockSizeHorizontal*30,
                        color: Colors.white70,
                        child: Center(
                          child: ListWheelScrollView(
                            children: Equations.genderEntries,
                            itemExtent: 40,
                            offAxisFraction: _value,
                            onSelectedItemChanged: (index) => Equations.setSex(index),
                          ),
                        ),
                      ),),
                    child: Equations.sex ? Text("Male",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),) : Text("Female",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),
                    ),
                  ),
                ],),
              ),
              Container(
                height: size100,
                width: ScreenSizeUtils.blockSizeHorizontal*22,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Text("Age",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size21,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  GestureDetector(
                    onTap:() => DialogUtils.showCustomDialog(context, title: "Age", okBtnFunction: null,
                      child: Container(
                        height: ScreenSizeUtils.blockSizeVertical*10,
                        width: ScreenSizeUtils.blockSizeHorizontal*30,
                        color: Colors.white,
                        child: Center(
                          child: ListWheelScrollView(
                            children: Equations.ageEntries,
                            itemExtent: 50,
                            offAxisFraction: _value,
                            onSelectedItemChanged: (index) => Equations.setAge(index),
                          ),
                        ),
                      ),),
                    child: Text(Equations.age.toString(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),),
                ],),
              ),
              Container(
                height: size100,
                width: ScreenSizeUtils.blockSizeHorizontal*24,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Text("Weight",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size21,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  GestureDetector(
                      onTap:() => DialogUtils.showCustomDialog(context, title: "Weight", okBtnFunction: null,
                        child: Container(
                          height: ScreenSizeUtils.blockSizeVertical*10,
                          width: ScreenSizeUtils.blockSizeHorizontal*30,
                          color: Colors.white,
                          child: Center(
                            child: ListWheelScrollView(
                              children: Equations.weightEntries,
                              itemExtent: 50,
                              offAxisFraction: _value,
                              onSelectedItemChanged: (index) => Equations.setWeight(index),
                            ),
                          ),
                        ),),
                      child: Text("${Equations.weight.toString()} lb",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF676666),
                        ),)),
                ],),
              ),
              Container(
                height: size100,
                width: ScreenSizeUtils.blockSizeHorizontal*25,
                color: Colors.white,
                child: Column(children: <Widget>[
                  Text("Circum",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: size21,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF655FB4),
                    ),),
                  GestureDetector(
                      onTap:() => DialogUtils.showCustomDialog(context, title: "Abdomen Circumference", okBtnFunction: null,
                        child: Container(
                          height: ScreenSizeUtils.blockSizeHorizontal*27,
                          width: ScreenSizeUtils.blockSizeHorizontal*25,
                          color: Colors.white,
                          child: Center(
                            child: ListWheelScrollView(
                              children: Equations.lungCircumferenceEntries,
                              itemExtent: 50,
                              offAxisFraction: _value,
                              onSelectedItemChanged: (index) => Equations.setCircumference(index),
                            ),
                          ),
                        ),),
                      child: Text("${Equations.circumference.toString()} cm",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF676666),
                        ),)),
                ],),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: ScreenSizeUtils.blockSizeHorizontal*2,),
              Text("Optimization",
                style: GoogleFonts.playfairDisplay(
                  fontSize: ScreenSizeUtils.blockSizeHorizontal*6.2,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF655FB4),
                ),),
              Spacer(),
              Text("Reference",
                style: GoogleFonts.playfairDisplay(
                  fontSize: ScreenSizeUtils.blockSizeHorizontal*7,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF655FB4),
                ),),
              SizedBox(width: ScreenSizeUtils.blockSizeHorizontal*7,),
            ],
          ),
          Row(
            children:<Widget> [
              Container(
                color: Colors.white,
                height: size80,
                width:  ScreenSizeUtils.blockSizeHorizontal*25,
                child: Column(
                  children:<Widget>[
                    Text("Parameter",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),
                    Text(Equations.isCTSelected[0] ?
                    Equations.CTAbdomenOptimumMASCalc().toInt().toString()
                        :
                    Equations.CBCTAbdomenOptimumMASCalc().toInt().toString(),
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: size80,
                width: ScreenSizeUtils.blockSizeHorizontal*25,
                child: Column(
                  children:<Widget>[
                    Text("Parameter",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),
                    Text(Equations.isCTSelected[0] ?
                    Equations.CTAbdomenOptimumKVPCalc().toInt().toString()
                        :
                    Equations.CBCTAbdomenOptimumKVPCalc().toInt().toString(),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF676666),
                        ),),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: size80,
                width: ScreenSizeUtils.blockSizeHorizontal*25,
                child: Column(
                  children:<Widget>[
                    Text("Parameter",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),
                    GestureDetector(
                        onTap:() => DialogUtils.showCustomDialog(context, title: "Parameter mAs", okBtnFunction: null,
                          child: Container(
                            height: ScreenSizeUtils.blockSizeHorizontal*27,
                            width:  ScreenSizeUtils.blockSizeHorizontal*25,
                            color:  Colors.white,
                            child: Center(
                              child: ListWheelScrollView(
                                children: Equations.mAsEntries,
                                itemExtent: 50,
                                offAxisFraction: _value,
                                onSelectedItemChanged: (index) => Equations.setRefmAs(index),
                              ),
                            ),
                          ),),
                        child: Text(Equations.refmAs.toString(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),)),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: size80,
                width: ScreenSizeUtils.blockSizeHorizontal*25,
                child: Column(
                  children:<Widget>[
                    Text("Parameter",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF676666),
                      ),),
                    GestureDetector(
                        onTap:() => DialogUtils.showCustomDialog(context, title: "Parameter kVp", okBtnFunction: null,
                          child: Container(
                            height: ScreenSizeUtils.blockSizeHorizontal*27,
                            width:  ScreenSizeUtils.blockSizeHorizontal*25,
                            color:  Colors.white,
                            child: Center(
                              child: ListWheelScrollView(
                                children: Equations.kVpEntries,
                                itemExtent: 50,
                                offAxisFraction: _value,
                                onSelectedItemChanged: (index) => Equations.setkVp(index),
                              ),
                            ),
                          ),),
                        child: Text(Equations.refkVp.toString(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF676666),
                          ),)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children:<Widget>[
              SizedBox(width: size50,),
              Text("Abdomen",
                style: GoogleFonts.playfairDisplay(
                  fontSize: size16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF676666),
                ),),
              Spacer(),
              Text("Abdomen",
                style: GoogleFonts.playfairDisplay(
                  fontSize: size16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF676666),
                ),),
              SizedBox(width: size50,),
            ],
          ),
          SizedBox(height: size10,),
          Row(
            children: <Widget>[
              Container(
                height: size300,
                width: ScreenSizeUtils.blockSizeHorizontal*50,
                color: Colors.white,
                child: Column(
                  children: [
                    BarChartSample1(doseInt:Equations.CTAbdomenOptimumDose(),
                      riskInt: Equations.sex ? Equations.CTAbdomenMaleOptimumRisk() : Equations.CTAbdomenMaleOptimumRisk(),
                      backGroundColor:Color(0xFF655FB4) ,
                    ),
                  ],
                ),
              ),
              Container(
                height: size300,
                width: ScreenSizeUtils.blockSizeHorizontal*50,
                color: Colors.white,
                child: Column(
                  children: [
                    BarChart2(doseInt:Equations.CTAbdomenReferralDose(),
                      riskInt:(Equations.sex ? Equations.CTAbdomenMaleReferralRisk() : Equations.CTAbdomenFemaleReferralRisk()),
                      backGroundColor:Colors.white70 ,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();


  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {@required String title,
        //String okBtnText = "Ok",
        String cancelBtnText = "Close",
        Widget child,
        @required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: child,
            actions: <Widget>[
              FlatButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}