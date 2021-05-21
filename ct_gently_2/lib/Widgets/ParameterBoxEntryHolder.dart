import 'package:ct_gently_2/Data/SettingsProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParameterBoxEntryHolder extends StatefulWidget {
  final double height;
  final double width;
  final String fieldName;
  final double fieldNameFontSize;

  //Dialog box Settings
  final String displayValue;
  final double displayValueFontSize;
  final double scrollHeight;
  final double scrollWidth;
  final double scrollViewItemExtent;
  final List<Widget> scrollChild;
  final int setValue;

  const ParameterBoxEntryHolder({Key key, this.height, this.width, this.fieldName, this.fieldNameFontSize, this.displayValue, this.displayValueFontSize, this.scrollHeight, this.scrollWidth, this.scrollViewItemExtent, this.scrollChild, this.setValue}) : super(key: key);

  @override
  _ParameterBoxEntryHolder createState() => _ParameterBoxEntryHolder();
}

class _ParameterBoxEntryHolder extends State<ParameterBoxEntryHolder> {
  bool dialogBoxVisibility = false;
  @override
  Widget build(BuildContext context) {
    final Settings = Provider.of<SettingsProvider>(context);
    return GestureDetector(
      onTap: ()
      {
        Settings.setDialogBox(true);
        Settings.setScrollHeight(widget.scrollHeight);
        Settings.setScrollWidth(widget.scrollWidth);
        Settings.setDialogBoxTitle(widget.fieldName);
        Settings.setListScrollView(widget.scrollChild);
        Settings.setScrollViewItemsExtent(widget.scrollViewItemExtent);
        Settings.setValueFunction(widget.setValue);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        color: dialogBoxVisibility? Colors.black : Colors.white,
        child: Column(
          children:<Widget>[
            Text(
              "${widget.fieldName}",
              style: GoogleFonts.playfairDisplay(
                fontSize: widget.fieldNameFontSize,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Color(0xFF676666),
              ),
            ),
            Text("${widget.displayValue}",
              style: GoogleFonts.playfairDisplay(
                fontSize: widget.displayValueFontSize,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Color(0xFF676666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
