import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AbdomenEquationsProvider extends ChangeNotifier{
  List<bool> _isCTSelected = <bool>[true, false];
  final List<Widget> genderEntries = <Widget>[
    ListTile(
      leading: ImageIcon(AssetImage("assets/boy.png")),
      title: Text('Male'),
    ),
    ListTile(
      leading: ImageIcon(AssetImage("assets/girl.png")),
      title: Text('Female'),
    ),
  ];

  final List<Widget> ageEntries = List<Widget>.generate(
    120,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          "${i + 1} yrs",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  final List<Widget> weightEntries = List<Widget>.generate(
    656,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          "${i + 6} lbs",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  final List<Widget> mAsEntries = List<Widget>.generate(
    431,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          " ${i + 10} mAs",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  final List<Widget> kVpEntries = List<Widget>.generate(
    101,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          "${i + 40} kVp",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  final List<Widget> lungCircumferenceEntries = List<Widget>.generate(
    206,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          "${i + 35} cm",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  bool _sex = true; //Male true, female false
  int _age = 1;
  int _weight = 6;
  int _circumference = 35;
  int _refmAs = 10;
  int _refkVp = 40;

  get isCTSelected => _isCTSelected;
  set isCTSelected(value){
    _isCTSelected = value;
    notifyListeners();
  }

  void setCTSelected(int index) {
    for (int buttonIndex = 0; buttonIndex < _isCTSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        _isCTSelected[buttonIndex] = true;
      } else {
        _isCTSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }

  get sex => _sex;
  set sex(value){
    _sex = value;
    notifyListeners();
  }

  void setSex(index) {
    if (index == 0){
      _sex = true;
    } else if(index == 1){
      _sex = false;
    }
    notifyListeners();
  }

  get age => _age;
  set age(value){
    _age = value;
    notifyListeners();
  }
  void setAge(index){
    _age = index + 1;
    notifyListeners();
  }

  get weight => _weight;
  set weight(value){
    _weight = value;
    notifyListeners();
  }
  void setWeight(index){
    _weight = index+6;
    notifyListeners();
  }

  get circumference => _circumference;
  set circumference(value){
    _circumference = value;
    notifyListeners();
  }
  void setCircumference(index){
    _circumference = index+35;
    notifyListeners();
  }

  get refmAs => _refmAs;
  set refmAs(value){
    _refmAs = value;
    notifyListeners();
  }

  void setRefmAs(index){
    _refmAs = index+10;
    notifyListeners();
  }

  get refkVp => _refkVp;
  set refkVp(value){
    _refkVp = value;
    notifyListeners();
  }

  void setkVp(index){
    _refkVp = index+40;
    notifyListeners();
  }

  double CTAbdomenOptimumKVPCalc(){
    double brainOptimumKVP = 20 + _circumference.toDouble();
    return brainOptimumKVP;
  }

  double CTAbdomenOptimumMASCalc(){
    double brainOptimumMAS = 160 - _circumference.toDouble();
    return brainOptimumMAS;
  }

  double CBCTAbdomenOptimumKVPCalc(){
    double brainOptimumKVP = 55 + 0.3 * _circumference.toDouble();
    return brainOptimumKVP;
  }

  double CBCTAbdomenOptimumMASCalc(){
    double brainOptimumMAS = 190.686 + 0.30949 * Math.pow(_circumference, 1.5).toDouble();
    return brainOptimumMAS;
  }

  double CBCTOptimumAbdomenDose(){
    double abdomenOptimumKVP = 50 + 0.3 * _circumference;
    double abdomenOptimumMAS = 190.686 + 0.30949 *( circumference * 0.5 *circumference);

    double optimumDose = 0.0;
    optimumDose = 0.5 * ((16.24 - 2.7 * (2.303 * Math.log(_weight)) - 0.018 * _age) + (
        33.55 - 6.21 *( 2.303 * Math.log(_circumference)) - 0.022 * _age) * (abdomenOptimumMAS/ 680)
        * Math.exp(0.00971 * abdomenOptimumKVP -125));
    return optimumDose;
  }
  double CBCTReferralAbdomenDose(){
    double referralDose =0.0;
    referralDose = 0.5 * ((16.24 - 2.7 * (2.303 * Math.log(_weight)) - 0.018 * _age) + (
        33.55 - 6.21 *( 2.303 * Math.log(_circumference)) - 0.022 * _age) * (_refmAs/ 680)
        * Math.exp(0.00971 * _refkVp -125));
    return referralDose;
  }

  double CBCTMaleOptimumAbdomenRisk(){
    double risk = 0.0;

    if(_age >= 30) {
      risk = 1.0 + 0.011 * (CBCTOptimumAbdomenDose() + 0.0087 * CBCTOptimumAbdomenDose()
          * CBCTOptimumAbdomenDose());

    } else if (age < 30) {
      risk = 1.0 + 0.011 * (CBCTOptimumAbdomenDose() + 0.0087 * CBCTOptimumAbdomenDose()
          * CBCTOptimumAbdomenDose()) * Math.exp(-0.04* (_age - 30));

    }
    return risk;
  }
  double CBCTMaleReferralAbdomenRisk(){
    double risk = 0.0;

    if(_age >= 30) {
      risk = 1.0 + 0.011 * (CBCTReferralAbdomenDose() + 0.0087 * CBCTReferralAbdomenDose()
          * CBCTReferralAbdomenDose());
    } else if (age < 30) {
      risk = 1.0 + 0.011 * (CBCTReferralAbdomenDose() + 0.0087 * CBCTReferralAbdomenDose()
          * CBCTReferralAbdomenDose()) * Math.exp(-0.04* (_age - 30));
    }
    return risk;
  }
  double CBCTFemaleOptimumAbdomenRisk(){
    double risk = 0.0;

    if(_age >= 30) {
      risk = 1.0 + 0.012 * (CBCTOptimumAbdomenDose() + 0.0087 * CBCTOptimumAbdomenDose()
          * CBCTOptimumAbdomenDose());
    } else if (age < 30) {
      risk = 1.0 + 0.012 * (CBCTOptimumAbdomenDose() + 0.0087 * CBCTOptimumAbdomenDose()
          * CBCTOptimumAbdomenDose()) * Math.exp(-0.04* (_age - 30));
    }
    return risk;
  }
  double CBCTFemaleReferralAbdomenRisk(){
    double risk = 0.0;

    if(_age >= 30) {
      risk = 1.0 + 0.012 * (CBCTReferralAbdomenDose() + 0.0087 * CBCTReferralAbdomenDose()
          * CBCTReferralAbdomenDose());
    } else if (age < 30) {
      risk = 1.0 + 0.012 * (CBCTReferralAbdomenDose() + 0.0087 * CBCTReferralAbdomenDose()
          * CBCTReferralAbdomenDose()) * Math.exp(-0.04* (_age - 30));
    }
    return risk;
  }

  double CTAbdomenOptimumDose(){
    double dose = 0.0;
    double opt_Kvp = 20 + _circumference.toDouble();
    double opt_mAs = 160 - _circumference.toDouble();
    dose = (0.56 - 0.00000026 * (_circumference*_circumference*_circumference)) * (opt_mAs / 100)*(opt_Kvp/120) * (opt_Kvp/120)
        * Math.sqrt(opt_Kvp/120);

    return dose;
  }

  double CTAbdomenReferralDose(){
    double dose = 0.0;
    dose = (0.56 - 0.00000026 * (_circumference*_circumference*_circumference)) * (_refmAs / 100)*(_refkVp/120) * (_refkVp/120)
        * Math.sqrt(_refkVp/120);

    return dose;
  }

  double CTAbdomenMaleOptimumRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.011 * (CTAbdomenOptimumDose() + 0.0087 * CTAbdomenOptimumDose() * CTAbdomenOptimumDose());
    } else if(_age < 30) {
      risk = 1.0 + 0.011 * (CTAbdomenOptimumDose() + 0.0087 * CTAbdomenOptimumDose() * CTAbdomenOptimumDose())
          * Math.exp(-0.04 * (age - 30));
    }
    return risk;
  }

  double CTAbdomenMaleReferralRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.011 * (CTAbdomenReferralDose() + 0.0087 * CTAbdomenReferralDose() * CTAbdomenReferralDose());
    } else if(_age < 30) {
      risk = 1.0 + 0.011 * (CTAbdomenReferralDose() + 0.0087 * CTAbdomenReferralDose() * CTAbdomenReferralDose())
          * Math.exp(-0.04 * (age - 30));
    }
    return risk;
  }

  double CTAbdomenFemaleOptimumRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.011 * (CTAbdomenOptimumDose() + 0.0087 * CTAbdomenOptimumDose() * CTAbdomenOptimumDose());
    } else if(_age < 30) {
      risk = 1.0 + 0.011 * (CTAbdomenOptimumDose() + 0.0087 * CTAbdomenOptimumDose() * CTAbdomenOptimumDose())
          * Math.exp(-0.04 * (age - 30));
    }
    return risk;
  }

  double CTAbdomenFemaleReferralRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.012 * (CTAbdomenReferralDose() + 0.0087 * CTAbdomenReferralDose() * CTAbdomenReferralDose());
    } else if(_age < 30) {
      risk = 1.0 + 0.012 * (CTAbdomenReferralDose() + 0.0087 * CTAbdomenReferralDose() * CTAbdomenReferralDose())
          * Math.exp(-0.04 * (age - 30));
    }
    return risk;
  }



}