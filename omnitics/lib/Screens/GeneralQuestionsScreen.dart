import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/SurveyData/SurveyProviderClass.dart';
import 'package:omnitics/SurveyData/SurveyQuestions.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GeneralQuestionsScreen extends StatefulWidget {
  @override
  _GeneralQuestionsScreenState createState() => _GeneralQuestionsScreenState();
}

class _GeneralQuestionsScreenState extends State<GeneralQuestionsScreen> {
  final CarouselController carouselController = CarouselController();

  int currentProgress;

  changeCarouselPosition(double value)
  {
    carouselController.animateToPage(value.toInt(), duration: Duration(milliseconds: 30));
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final SurveyResults = Provider.of<SurveyProviderClass>(context);
    currentProgress = SurveyResults.currentProgress;

    return Scaffold(
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 3.0.h,),
            Text((currentProgress < 29) ? "General " : (currentProgress < 41) ? "Male" : "Female",
              style: GoogleFonts.raleway(
                  fontSize: 32.0.sp,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  color: Colors.black
              ),),
            Text("Questions",
              style: GoogleFonts.raleway(
                  fontSize: 32.0.sp,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.normal,
                  color: Colors.black
              ),),

            Row(
              children: [
                Text("Progress : ",
                  style: GoogleFonts.raleway(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),),
                Text("$currentProgress",
                  style: GoogleFonts.raleway(
                      fontSize: 19.0.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),),
                Text(" / ${SurveyQuestions().questionList.length - 1} Answered",
                  style: GoogleFonts.raleway(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),),
              ],
            ),
            Slider(
              value: currentProgress.toDouble(),
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              onChanged: (value)
              {
                SurveyResults.setCurrentProgress(value.toInt());
                changeCarouselPosition(value);
              },
              min: 0,
              max: (SurveyQuestions().questionList.length).toDouble()-1,
              label: "Progress",
            ),
            Container(
              height: 0.1.h,
              width:screenWidth,
              color: Colors.black,),
            Container(
              height: 60.0.h,
              color: Colors.white70,
              width: screenWidth,
              child: CarouselSlider(
                carouselController: carouselController,
                  options: CarouselOptions(
                      height: 59.9.h,
                      initialPage: currentProgress,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 16/9,
                      onPageChanged: (index, reason) {
                        SurveyResults.setCurrentProgress(index);
                      }
                  ),
                  items: SurveyQuestions().questionList
              ),
            ),
            Container(
              height: 0.1.h,
              width:screenWidth,
              color: Colors.black,),

          ],
        ),
      ),
    );
  }
}

