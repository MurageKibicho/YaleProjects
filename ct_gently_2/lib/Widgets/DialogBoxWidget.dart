import 'package:ct_gently_2/Data/AbdomenEquationsProvider.dart';
import 'package:ct_gently_2/Data/BrainEquationsProvider.dart';
import 'package:ct_gently_2/Data/SettingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DialogBoxWidget extends StatefulWidget {
  final int screen;
  final double height;
  final double width;
  final String title;
  final double titleFontSize;
  final double scrollHeight;
  final double scrollWidth;
  final double scrollViewItemExtent;
  final List<Widget> scrollChild;
  final int setValue;


  const DialogBoxWidget({Key key, this.height, this.width, this.title, this.titleFontSize, this.scrollHeight, this.scrollWidth, this.scrollViewItemExtent, this.scrollChild, this.setValue, this.screen}) : super(key: key);

  @override
  _DialogBoxWidgetState createState() => _DialogBoxWidgetState();
}

class _DialogBoxWidgetState extends State<DialogBoxWidget> {
  int currentIndexInternal = 0;
  @override
  Widget build(BuildContext context) {
    var Equations;
    if(widget.screen == 0)
      {
         Equations = Provider.of<BrainEquationsProvider>(context);
      }
    else
      {
        Equations = Provider.of<AbdomenEquationsProvider>(context);
      }

    final Settings = Provider.of<SettingsProvider>(context);
    void SetValue(int currentIndex, int functionIndex)
    {
      setState(() {
        currentIndexInternal = currentIndex;
      });
      if(functionIndex == 0)
      {
        Equations.setSex(currentIndex);
      }
      else if(functionIndex == 1)
      {
        Equations.setAge(currentIndex);
      }
      else if(functionIndex == 2)
      {
        Equations.setWeight(currentIndex);
      }
      else if(functionIndex == 3)
      {
        Equations.setCircumference(currentIndex);
      }
      else if(functionIndex == 4)
      {
        Equations.setRefmAs(currentIndex);
      }
      else if(functionIndex == 5)
      {
        Equations.setkVp(currentIndex);
      }
    }

    String setDialogBoxTitle(int index, String currentTitle)
    {
      if(index == 3)
        {
          return "Head Circumference";
        }
      else
        {
        return currentTitle;
        }
    }

    return Container(
      child: Center(
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: Text(
                  setDialogBoxTitle(widget.setValue, widget.title),
                style: GoogleFonts.sourceSansPro(
                  fontSize: widget.titleFontSize,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF655FB4) ,
                ),),
              ),
             Center(
               child: Text(
                 currentIndexInternal != widget.scrollChild.length-1 ? "Scroll down for more":"Scroll up for more",
                 style: GoogleFonts.sourceSansPro(
                   fontSize: 15.0,
                   fontWeight: FontWeight.bold,
                   fontStyle: FontStyle.normal,
                   color: Colors.black,
                 ),
               ),
             ),
             Center(
               child: Container(
            height: widget.scrollHeight,
            width: widget.scrollWidth,
            child: ListWheelScrollView(
              physics: FixedExtentScrollPhysics(),
                diameterRatio: 1,
                children: widget.scrollChild,
                itemExtent: widget.scrollViewItemExtent,
                offAxisFraction: 0,
                onSelectedItemChanged: (index) => SetValue(index, widget.setValue)),
            ),
             ),
              GestureDetector(
                  onTap: (){
                    Settings.setDialogBox(false);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: widget.height*0.2,
                        width: 100,
                        color: Colors.transparent,
                        child: Text("Close",
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF655FB4) ,
                          ),),
                      ),
                    ),
                  ),),
            ],
          ),

        ),
      ),
    );

  }

}
