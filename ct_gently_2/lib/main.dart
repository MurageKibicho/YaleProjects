import 'package:ct_gently_2/Data/BrainEquationsProvider.dart';
import 'package:ct_gently_2/Data/ChestEquationsProvider.dart';
import 'package:ct_gently_2/Data/SettingsProvider.dart';
import 'package:ct_gently_2/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Data/AbdomenEquationsProvider.dart';
import 'package:sizer/sizer_util.dart';

void main() {
  runApp(
      MultiProvider(providers:[
        ChangeNotifierProvider(create: (context) => ChestEquationsProvider(),),
        ChangeNotifierProvider(create: (context) => AbdomenEquationsProvider(),),
        ChangeNotifierProvider(create: (context) => BrainEquationsProvider(),),
        ChangeNotifierProvider(create: (context) => SettingsProvider(),),
      ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                SizerUtil().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'CT Gently +',
                  theme: ThemeData(
                    primaryColor: Colors.white,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: Home(),
                );
              }
          );
        }

    );
  }
}
