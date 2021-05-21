import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/SurveyProviderClass.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class OtherAnswersCard extends StatefulWidget {
  final int numberOfAnswers;
  final String question;
  final String answerOne;
  final String answerTwo;
  final String answerThree;
  final String answerFour;
  final int index;

  const OtherAnswersCard({Key key, this.numberOfAnswers, this.question, this.answerOne, this.answerTwo, this.answerThree, this.answerFour, this.index}) : super(key: key);
  @override
  _OtherAnswersCardState createState() => _OtherAnswersCardState();
}

class _OtherAnswersCardState extends State<OtherAnswersCard> {
  int selectedRadio;
  int currentCard;


  @override
  Widget build(BuildContext context) {
    currentCard = widget.index;
    final SurveyResults = Provider.of<SurveyProviderClass>(context);
    if(currentCard == 1){selectedRadio = SurveyResults.question1;}
    else if(currentCard == 2){selectedRadio = SurveyResults.question2;}
    else if(currentCard == 3){selectedRadio = SurveyResults.question3;}
    else if(currentCard == 4){selectedRadio = SurveyResults.question4;}
    else if(currentCard == 5){selectedRadio = SurveyResults.question5;}
    else if(currentCard == 6){selectedRadio = SurveyResults.question6;}
    else if(currentCard == 33){selectedRadio = SurveyResults.question33;}
    else if(currentCard == 43){selectedRadio = SurveyResults.question43;}
    else if(currentCard == 44){selectedRadio = SurveyResults.question44;}
    else if(currentCard == 45){selectedRadio = SurveyResults.question45;}
    else if(currentCard == 46){selectedRadio = SurveyResults.question46;}
    else if(currentCard == 51){selectedRadio = SurveyResults.question51;}
    else if(currentCard == 56){selectedRadio = SurveyResults.question56;}
    else{selectedRadio = 0;}

    void TapContainer(int value)
    {
      if(currentCard == 1){SurveyResults.setQuestionOne(value);}
      else if(currentCard == 2){SurveyResults.setQuestionTwo(value);}
      else if(currentCard == 3){SurveyResults.setQuestionThree(value);}
      else if(currentCard == 4){SurveyResults.setQuestionFour(value);}
      else if(currentCard == 5){SurveyResults.setQuestionFive(value);}
      else if(currentCard == 6){SurveyResults.setQuestionSix(value);}
      else if(currentCard == 33){SurveyResults.setQuestionThirtyThree(value);}
      else if(currentCard == 43){SurveyResults.setQuestionFortyThree(value);}
      else if(currentCard == 44){SurveyResults.setQuestionFortyFour(value);}
      else if(currentCard == 45){SurveyResults.setQuestionFortyFive(value);}
      else if(currentCard == 46){SurveyResults.setQuestionFortySix(value);}
      else if(currentCard == 51){SurveyResults.setQuestionFiftyOne(value);}
      else if(currentCard == 56){SurveyResults.setQuestionFiftySix(value);}
    }

    return Container(
      height: 530,
      width: 200.0.w,
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Column(
              children: [
                SizedBox(height: 1.0.h,),
                Padding(
                  padding: EdgeInsets.all(1.0.h),
                  child: Text("${widget.question}",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 1.0.h),
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
                        height: 7.0.h,
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
                            Radio(
                              value: 1,
                              groupValue: selectedRadio,
                              activeColor: Colors.black,
                              onChanged: (value)
                              {
                                TapContainer(1);
                              },
                            ),
                            Text("${widget.answerOne}",
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
                      onTap: () { TapContainer(2);},
                      child: Container(
                        padding: EdgeInsets.all(1.0.h),
                        width: 65.0.w,
                        height: 7.0.h,
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
                            Radio(
                              value: 2,
                              groupValue: selectedRadio,
                              activeColor: Colors.black,
                              onChanged: (value)
                              {
                                TapContainer(2);
                              },
                            ),
                            Text("${widget.answerTwo}",
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
                    Visibility(
                      visible: (widget.numberOfAnswers >= 3) ? true : false,
                      child: GestureDetector(
                        onTap: ()
                        {
                          TapContainer(3);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.0.h),
                          width: 65.0.w,
                          height: 7.0.h,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
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
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: selectedRadio,
                                activeColor: Colors.black,
                                onChanged: (value)
                                {
                                  TapContainer(3);
                                },
                              ),
                              Text("${widget.answerThree}",
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
                    ),
                    Visibility(
                      visible: (widget.numberOfAnswers > 3) ? true : false,
                      child: GestureDetector(
                        onTap: ()
                        {
                          TapContainer(4);
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.0.h),
                          width: 65.0.w,
                          height: 7.0.h,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              end: BorderSide(
                                color: Colors.black,
                                width: 5.0,
                                style: BorderStyle.solid,
                              ),
                              start: BorderSide(
                                color: Colors.black,
                                width: 1.0,
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
                              Radio(
                                value: 4,
                                groupValue: selectedRadio,
                                activeColor: Colors.black,
                                onChanged: (value)
                                {
                                  TapContainer(4);
                                },
                              ),
                              Text("${widget.answerFour}",
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
                    ),
                    SizedBox(height: 20.0.h,),

                  ],
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
