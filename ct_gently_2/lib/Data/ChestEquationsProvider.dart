import 'package:flutter/material.dart';
import 'dart:math' as Math;

class ChestEquationsProvider extends ChangeNotifier{
  List<bool> _isCTSelected = <bool>[true, false];
  final List<Widget> genderEntries = <Widget>[
    ListTile(
      leading: ImageIcon(AssetImage("assets/girl.png")),
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
          "${i + 6} kg",
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
          "${i + 10} mAs",
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

  double CTChestOptimumKVPCalc(){
    double brainOptimumKVP = _circumference.toDouble();
    return brainOptimumKVP;
  }

  double CTChestOptimumMASCalc(){
    double brainOptimumMAS = 72 - 0.1 *_circumference.toDouble();
    return brainOptimumMAS;
  }

  double CBCTChestOptimumKVPCalc(){
    double brainOptimumKVP = 50 + 0.5 * _circumference.toDouble();
    return brainOptimumKVP;
  }

  double CBCTChestOptimumMASCalc(){
    double brainOptimumMAS = 195.67 + 0.0001645 *(_circumference * _circumference * _circumference).toDouble();
    return brainOptimumMAS;
  }

  double CBCTOptimumChestDose(){
    double chestOptimumKVP = 50 + 0.5 * _circumference;
    double chestOptimumMAS = 195.67 + 0.0001645 * (_circumference *_circumference *_circumference);
    double optimumDose =0.0;

    optimumDose = (10.53 - 0.0686 * _circumference) * (chestOptimumMAS / 680)*
        Math.exp(0.00971 * (chestOptimumKVP -125));

    return optimumDose;
  }

  double CBCTReferralChestDose(){

    double referralDose = 0.0;
    referralDose = (10.53 - 0.0686 * _circumference) * (_refmAs / 680)*
        Math.exp(0.00971 * (_refkVp -125));

    return referralDose;
  }

  double CBCTMaleOptimumChestRisk(){
    double risk = 0.0;

    if (_age >= 30 ) {
      risk =1.0 + 0.0032* CBCTOptimumChestDose();
    }
    else if(_age < 30) {
      risk = 1.0 + 0.0032 * CBCTOptimumChestDose() * Math.exp(-0.03 *(_age - 30));
    }
    return risk;
  }

  double CBCTMaleReferralChestRisk(){
    double risk = 0.0;

    if (_age >= 30 ) {
      risk =1.0 + 0.0032 * CBCTReferralChestDose();
    }
    else if(_age < 30) {
      risk = 1.0 + 0.0032 * CBCTReferralChestDose() * Math.exp(-0.03 *(_age - 30));
    }
    return risk;
  }

  double CBCTFemaleOptimumChestRisk(){
    double risk = 0.0;

    if (_age >= 30 ) {
      risk =1.0 + 0.014 * CBCTOptimumChestDose();
    }
    else if(_age < 30) {
      risk = 1.0 + 0.014 * CBCTOptimumChestDose() * Math.exp(-0.03 *(_age - 30));
    }
    return risk;
  }
  double CBCTFemaleReferralChestRisk(){
    double risk = 0.0;

    if (_age >= 30 ) {
      risk =1.0 + 0.0014 * CBCTReferralChestDose();
    }
    else if(_age < 30) {
      risk = 1.0 + 0.0032 * CBCTReferralChestDose() * Math.exp(-0.03 *(_age - 30));
    }
    return risk;
  }

  double CTChestOptimumDose(){
    double opt_Kvp = _circumference.toDouble();
    double opt_mAs = 72 - 0.1 * _circumference;
    double dose = 0.0;
    dose = (4.91 - 0.024 * _circumference) * (opt_mAs / 275) * (opt_Kvp / 120);

    return dose;
  }

  double CTChestReferralDose(){
    double dose = 0.0;
    dose = (4.91 - 0.024 * _circumference) * (_refmAs / 275) * (_refkVp / 120);
    return dose;
  }


  double CTChestMaleOptimumRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.0032 * CTChestOptimumDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.0032 * CTChestOptimumDose();
    }
    return risk;
  }
  double CTChestMaleReferralRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.0032 * CTChestReferralDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.0032 * CTChestReferralDose();
    }
    return risk;
  }

  double CTChestFemaleOptimumRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.014 * CTChestOptimumDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.0032 * CTChestOptimumDose();
    }
    return risk;
  }
  double CTChestFemaleReferralRisk(){
    double risk = 0.0;
    if(_age >= 30){
      risk = 1.0 + 0.014 * CTChestReferralDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.014 * CTChestReferralDose();
    }
    return risk;
  }


}