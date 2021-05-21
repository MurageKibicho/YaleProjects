import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/SurveyProviderClass.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SliderCard extends StatefulWidget {
  final String question;
  final double min;
  final double max;
  final int index;
  final bool changeFont;

  const SliderCard({Key key, this.question, this.min, this.max, this.index, this.changeFont}) : super(key: key);

  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  double sliderValue;
  int currentCard;


  @override
  Widget build(BuildContext context) {
    currentCard = widget.index;
    final SurveyResults = Provider.of<SurveyProviderClass>(context);
    if(currentCard == 0){sliderValue = SurveyResults.question0;}
    else if(currentCard == 7){sliderValue = SurveyResults.question7;}
    else if(currentCard == 30){sliderValue = SurveyResults.question30;}
    else if(currentCard == 32){sliderValue = SurveyResults.question32;}
    else if(currentCard == 34){sliderValue = SurveyResults.question34;}
    else if(currentCard == 35){sliderValue = SurveyResults.question35;}
    else if(currentCard == 40){sliderValue = SurveyResults.question40;}
    else if(currentCard == 41){sliderValue = SurveyResults.question41;}
    else if(currentCard == 47){sliderValue = SurveyResults.question47;}
    else if(currentCard == 48){sliderValue = SurveyResults.question48;}
    else if(currentCard == 50){sliderValue = SurveyResults.question50;}
    else if(currentCard == 52){sliderValue = SurveyResults.question52;}
    else{sliderValue = 35;}
    return Container(
      height: 100.0.h,
      width: 300.0.w,
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Column(
              children: [
                SizedBox(height: 1.0.h,),
                Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: Text("${widget.question}",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                        fontSize: (widget.changeFont) ? 25.0.sp : 21.0.sp,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 3.0.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${sliderValue.toInt()}",
                      style: GoogleFonts.raleway(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: Colors.black
                      ),
                    ),
                    Slider(
                      value: sliderValue,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      onChanged: (value)
                      {
                        if(currentCard == 0){SurveyResults.setQuestionZero(value);}
                        else if(currentCard == 7){SurveyResults.setQuestionSeven(value);}
                        else if(currentCard == 30){SurveyResults.setQuestionThirty(value);}
                        else if(currentCard == 32){SurveyResults.setQuestionThirtyTwo(value);}
                        else if(currentCard == 34){SurveyResults.setQuestionThirtyFour(value);}
                        else if(currentCard == 35){SurveyResults.setQuestionThirtyFive(value);}
                        else if(currentCard == 40){SurveyResults.setQuestionForty(value);}
                        else if(currentCard == 41){SurveyResults.setQuestionFortyOne(value);}
                        else if(currentCard == 47){SurveyResults.setQuestionFortySeven(value);}
                        else if(currentCard == 48){SurveyResults.setQuestionFortyEight(value);}
                        else if(currentCard == 50){SurveyResults.setQuestionFifty(value);}
                        else if(currentCard == 52){SurveyResults.setQuestionFiftyTwo(value);}
                      },
                      min: widget.min,
                      max: widget.max,
                    ),

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
