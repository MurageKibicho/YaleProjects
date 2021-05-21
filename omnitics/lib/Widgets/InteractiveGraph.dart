import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class InteractiveGraph extends StatefulWidget {
  @override
  _InteractiveGraphState createState() => _InteractiveGraphState();
}

class _InteractiveGraphState extends State<InteractiveGraph> {
  int _current1 = 0;
  int _current2 = 0;
  int _current3 = 0;
  int _current4 = 0;
  int _current5 = 0;
  int _current6 = 0;
  int _current7 = 0;
  int _current8 = 0;
  int _current9 = 0;
  void initState() {
    super.initState();
    _current1 = 0;
    _current2 = 0;
    _current3 = 0;
    _current4 = 0;
    _current5 = 0;
    _current6 = 0;
    _current7 = 0;
    _current8 = 0;
    _current9 = 0;
  }

  setSlidervalue(double value, int sliderIndex)
  {
    setState(() {
      if(sliderIndex == 1){_current1 = value.toInt();}
      else if(sliderIndex == 2){_current2 = value.toInt();}
      else if(sliderIndex == 3){_current3 = value.toInt();}
      else if(sliderIndex == 4){_current4 = value.toInt();}
      else if(sliderIndex == 5){_current5 = value.toInt();}
      else if(sliderIndex == 6){_current6 = value.toInt();}
      else if(sliderIndex == 7){_current7 = value.toInt();}
      else if(sliderIndex == 8){_current8 = value.toInt();}
      else if(sliderIndex == 9){_current9 = value.toInt();}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              Center(child: Padding(
                padding: EdgeInsets.all(0.5.h),
                child: Text("Slide to Adjust",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),),
              )),
              Container(
                height: 2,
                width:100.0.w,
                color: Colors.black,),
              Row(
                children: [
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Parameter 1",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current1.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 1);
                              _current1 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 2",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current2.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 2);
                              _current2 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 3",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current3.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 3);
                              _current3 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 4",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current4.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 4);
                              _current4 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 5",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current5.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 5);
                              _current5 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 6",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current6.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 6);
                              _current6 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 7",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current7.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value,7);
                              _current7 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 8",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current8.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 8);
                              _current8 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.0.w / 3,
                    child: Column(
                      children: [
                        Text("Parameter 9",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                        Container(
                          height: 4.0.h,
                          child: Slider(
                            value: _current9.toDouble(),
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            onChanged: (value)
                            {
                              setSlidervalue(value, 9);
                              _current9 = value.toInt();
                            },
                            min: 0,
                            max: 100,
                            label: "Progress",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GraphSlider(height: _current1, name: "Billiary"),
                  GraphSlider(height: _current2, name: "Bladder"),
                  GraphSlider(height: _current3, name: "Colorectal"),
                  GraphSlider(height: _current4, name: "Glioma"),
                  GraphSlider(height: _current5, name: "Head and Neck"),
                  GraphSlider(height: _current6, name: "Hematopoeitic"),
                  GraphSlider(height: _current7, name: "Liver"),
                  GraphSlider(height: _current8, name: "Lung"),
                  GraphSlider(height: _current9, name: "Melanoma"),
                  GraphSlider(height: _current1, name: "Pancreas"),
                  GraphSlider(height: _current2, name: "Renal"),
                  GraphSlider(height: _current3, name: "Thyroid"),
                  GraphSlider(height: _current4, name: "Upper GI"),
                  GraphSlider(height: _current2, name: "Pale Breast"),
                  GraphSlider(height: _current8, name: "Prostate"),
                ],
              ),

              Container(
                height: 2,
                width:100.0.w,
                color: Colors.black,),
            ],
          ),
        ),
        Positioned(
          bottom: 70,
          child: Container(
            height: 30.0.h,
            width: 100.0.w,
            color: Colors.transparent,

          ),
        ),
      ],
    );
  }
}

class GraphSlider extends StatefulWidget {
  final height;
  final name;

  const GraphSlider({Key key, this.height, this.name}) : super(key: key);
  @override
  _GraphSliderState createState() => _GraphSliderState();
}

class _GraphSliderState extends State<GraphSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${widget.height}",
          style: GoogleFonts.sourceSansPro(
              fontSize: 11.0.sp,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.normal,
              color: Colors.black
          ),),
        Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              height: 0.34.h * widget.height.toDouble(),
              width: 100.0.w / 15.5,
              decoration: BoxDecoration(
                color: setColor(0.009*widget.height.toDouble()),

              ),
            ),
            Positioned(
              bottom: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text("${widget.name}",
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.normal,
                      color: Colors.black
                  ),
                ),
              ),
            )
          ],
        ),
      ],
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
}




