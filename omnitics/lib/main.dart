import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omnitics/Screens/BodyScreen.dart';
import 'package:omnitics/Screens/GeneralQuestionsScreen.dart';
import 'package:omnitics/Screens/GraphScreen.dart';
import 'package:flutter/services.dart';
import 'package:omnitics/Screens/LiquidScreen.dart';
import 'package:omnitics/SurveyData/CancerRiskProvider.dart';
import 'package:omnitics/SurveyData/SurveyProviderClass.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer_util.dart';
import 'Screens/MainScreen.dart';

void main() {
  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider(create: (context) => SurveyProviderClass(),),
        ChangeNotifierProvider(create: (context) => CancerRiskData(),),
      ],
          child: MyApp()
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Omnitics',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: MyStatefulWidget(),
              );
            }
        );
      }

    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static  TextStyle optionStyle =
  TextStyle(fontSize: 30.0.sp, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    GeneralQuestionsScreen(),
    BodyScreen(),
    GraphScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 9.0.sp,
        selectedLabelStyle: TextStyle(
          fontStyle: FontStyle.normal),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/icons/questions.png"), size: 30,
              color: Colors.black,),
            label: 'Survey',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/icons/user.png"), size: 30,
              color: Colors.black,),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("Assets/icons/analytics.png"), size: 30,),
            label: 'Results',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black.withOpacity(0.4),
        selectedItemColor: Colors.black.withOpacity(1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
