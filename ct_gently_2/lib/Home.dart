import 'package:ct_gently_2/Screens/AbdomenScreen.dart';
import 'package:ct_gently_2/Screens/BrainScreen.dart';
import 'package:ct_gently_2/Screens/ChestScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    BrainScreen(),
    ChestScreen(),
    AbdomenScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CT Gently +",
            style: GoogleFonts.playfairDisplay(
              fontSize: 15.0.sp,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Color(0xFF655FB4),
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/brain.png"),size: 5.0.h,),
            label: 'Brain',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/lungs.png"),size: 5.0.h,),
            label: 'Chest',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/stomach.png"),size: 5.0.h,),
            label: 'Abdomen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 10.0.sp,
        selectedItemColor: Color(0xFF655FB4),
        onTap: _onItemTapped,
      ),
    );
  }
  }



