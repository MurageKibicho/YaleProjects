import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/SurveyProviderClass.dart';
import 'package:omnitics/Widgets/ProgressBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class YesNoCard extends StatefulWidget {
  final String question;
  final int index;

  const YesNoCard({Key key, this.question, this.index}) : super(key: key);

  @override
  _YesNoCardState createState() => _YesNoCardState();
}

class _YesNoCardState extends State<YesNoCard> {
  int selectedRadio;
  int currentCard;

  @override
  Widget build(BuildContext context) {
    currentCard = widget.index;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final SurveyResults = Provider.of<SurveyProviderClass>(context);
    if(currentCard == 8){selectedRadio = SurveyResults.question8;}
    else if(currentCard == 9){selectedRadio = SurveyResults.question9;}
    else if(currentCard == 10){selectedRadio = SurveyResults.question10;}
    else if(currentCard == 11){selectedRadio = SurveyResults.question11;}
    else if(currentCard == 12){selectedRadio = SurveyResults.question12;}
    else if(currentCard == 13){selectedRadio = SurveyResults.question13;}
    else if(currentCard == 14){selectedRadio = SurveyResults.question14;}
    else if(currentCard == 15){selectedRadio = SurveyResults.question15;}
    else if(currentCard == 16){selectedRadio = SurveyResults.question16;}
    else if(currentCard == 17){selectedRadio = SurveyResults.question17;}
    else if(currentCard == 18){selectedRadio = SurveyResults.question18;}
    else if(currentCard == 19){selectedRadio = SurveyResults.question19;}
    else if(currentCard == 20){selectedRadio = SurveyResults.question20;}
    else if(currentCard == 21){selectedRadio = SurveyResults.question21;}
    else if(currentCard == 22){selectedRadio = SurveyResults.question22;}
    else if(currentCard == 23){selectedRadio = SurveyResults.question23;}
    else if(currentCard == 24){selectedRadio = SurveyResults.question24;}
    else if(currentCard == 25){selectedRadio = SurveyResults.question25;}
    else if(currentCard == 26){selectedRadio = SurveyResults.question26;}
    else if(currentCard == 27){selectedRadio = SurveyResults.question27;}
    else if(currentCard == 28){selectedRadio = SurveyResults.question28;}
    else if(currentCard == 29){selectedRadio = SurveyResults.question29;}
    else if(currentCard == 31){selectedRadio = SurveyResults.question31;}
    else if(currentCard == 36){selectedRadio = SurveyResults.question36;}
    else if(currentCard == 37){selectedRadio = SurveyResults.question37;}
    else if(currentCard == 38){selectedRadio = SurveyResults.question38;}
    else if(currentCard == 39){selectedRadio = SurveyResults.question39;}
    else if(currentCard == 42){selectedRadio = SurveyResults.question42;}
    else if(currentCard == 49){selectedRadio = SurveyResults.question49;}
    else if(currentCard == 53){selectedRadio = SurveyResults.question53;}
    else if(currentCard == 54){selectedRadio = SurveyResults.question54;}
    else if(currentCard == 55){selectedRadio = SurveyResults.question55;}
    else if(currentCard == 57){selectedRadio = SurveyResults.question57;}
    else if(currentCard == 58){selectedRadio = SurveyResults.question58;}
    else if(currentCard == 59){selectedRadio = SurveyResults.question59;}
    else if(currentCard == 60){selectedRadio = SurveyResults.question60;}
    else{selectedRadio = 0;}

    void TapContainer(int value)
    {
      if(currentCard == 8){SurveyResults.setQuestionEight(value);}
      else if(currentCard == 9){SurveyResults.setQuestionNine(value);}
      else if(currentCard == 10){SurveyResults.setQuestionTen(value);}
      else if(currentCard == 11){SurveyResults.setQuestionEleven(value);}
      else if(currentCard == 12){SurveyResults.setQuestionTwelve(value);}
      else if(currentCard == 13){SurveyResults.setQuestionThirteen(value);}
      else if(currentCard == 14){SurveyResults.setQuestionFourteen(value);}
      else if(currentCard == 15){SurveyResults.setQuestionFifteen(value);}
      else if(currentCard == 16){SurveyResults.setQuestionSixteen(value);}
      else if(currentCard == 17){SurveyResults.setQuestionSeventeen(value);}
      else if(currentCard == 18){SurveyResults.setQuestionEighteen(value);}
      else if(currentCard == 19){SurveyResults.setQuestionNineteen(value);}
      else if(currentCard == 20){SurveyResults.setQuestionTwenty(value);}
      else if(currentCard == 21){SurveyResults.setQuestionTwentyOne(value);}
      else if(currentCard == 22){SurveyResults.setQuestionTwentyTwo(value);}
      else if(currentCard == 23){SurveyResults.setQuestionTwentyThree(value);}
      else if(currentCard == 24){SurveyResults.setQuestionTwentyFour(value);}
      else if(currentCard == 25){SurveyResults.setQuestionTwentyFive(value);}
      else if(currentCard == 26){SurveyResults.setQuestionTwentySix(value);}
      else if(currentCard == 27){SurveyResults.setQuestionTwentySeven(value);}
      else if(currentCard == 28){SurveyResults.setQuestionTwentyEight(value);}
      else if(currentCard == 29){SurveyResults.setQuestionTwentyNine(value);}
      else if(currentCard == 31){SurveyResults.setQuestionThirtyOne(value);}
      else if(currentCard == 36){SurveyResults.setQuestionThirtySix(value);}
      else if(currentCard == 37){SurveyResults.setQuestionThirtySeven(value);}
      else if(currentCard == 38){SurveyResults.setQuestionThirtyEight(value);}
      else if(currentCard == 39){SurveyResults.setQuestionThirtyNine(value);}
      else if(currentCard == 42){SurveyResults.setQuestionFortyTwo(value);}
      else if(currentCard == 49){SurveyResults.setQuestionFortyNine(value);}
      else if(currentCard == 53){SurveyResults.setQuestionFiftyThree(value);}
      else if(currentCard == 54){SurveyResults.setQuestionFiftyFour(value);}
      else if(currentCard == 55){SurveyResults.setQuestionFiftyFive(value);}
      else if(currentCard == 57){SurveyResults.setQuestionFiftySeven(value);}
      else if(currentCard == 58){SurveyResults.setQuestionFiftyEight(value);}
      else if(currentCard == 59){SurveyResults.setQuestionFiftyNine(value);}
      else if(currentCard == 60){SurveyResults.setQuestionSixty(value);}
    }
    return Container(
      height: 460,
      width: 400,
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children:[
            Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.question}",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 1),
                SingleChildScrollView(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: ()
                            {
                              TapContainer(1);
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.0.h),
                              width: 65.0.w,
                              height: 8.0.h,
                              decoration: BoxDecoration(
                                border: BorderDirectional(
                                  top: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                  ),
                                  start: BorderSide(
                                    color: Colors.black,
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                  ),
                                  end: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 3.0.h,),
                                  Radio(
                                    value: 1,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.black,
                                    onChanged: (value)
                                    {
                                      TapContainer(value);
                                    },
                                  ),
                                  SizedBox(width: 3.0.h,),
                                  Text("Yes",
                                    style: GoogleFonts.raleway(
                                        fontSize: 13.5.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
                              TapContainer(2);
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.0.h),
                              width: 65.0.w,
                              height: 8.0.h,
                              decoration: BoxDecoration(
                                border: BorderDirectional(
                                  top: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                  ),
                                  start: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                  end: BorderSide(
                                    color: Colors.black,
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 3.45.h,),
                                  Radio(
                                    value: 2,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.black,
                                    onChanged: (value)
                                    {
                                      TapContainer(value);
                                    },
                                  ),
                                  SizedBox(width: 3.2.h,),
                                  Text("No",
                                    style: GoogleFonts.raleway(
                                        fontSize: 13.5.sp,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12,
            offset: Offset(0,6),
          ),
        ],
      ),

    );
  }
}
