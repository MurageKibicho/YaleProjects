import 'package:flutter/material.dart';
import 'dart:math' as Math;

class BrainEquationsProvider extends ChangeNotifier{
  List<bool> _isCTSelected = <bool>[true, false];
  final List<Widget> genderEntries = <Widget>[
    ListTile(
      leading: ImageIcon(AssetImage("assets/boy.png")),
      title: Card(
          color: Colors.white70,
          child: Center(
            child: Text('  Male  ',
                style: TextStyle(color: Colors.black)),
          )),
    ),
    ListTile(
      leading: ImageIcon(AssetImage("assets/girl.png")),
      title: Card(
          color: Colors.white70,
          child: Center(
            child: Text('Female',
                style: TextStyle(color: Colors.black)),
          )),
    ),
  ];

  final List<Widget> ageEntries = List<Widget>.generate(
    120,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          " ${i + 1} yrs",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );

  final List<Widget> weightEntries = List<Widget>.generate(
    295,
        (i) => Card(
      color: Colors.white70,
      child: Center(
        child: Text(
          "${i + 6} lb",
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
    66,
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


  double CTbrainOptimumKVPCalc(){
    double brainOptimumKVP = 2 * _circumference.toDouble();
    return brainOptimumKVP;
  }

  double CTbrainOptimumMASCalc(){
    double brainOptimumMAS = 140 - _circumference.toDouble();
    return brainOptimumMAS;
  }

  double CBCTbrainOptimumKVPCalc(){
    double brainOptimumKVP = (5 * _circumference.toDouble() - 100) / 3;
    return brainOptimumKVP;
  }

  double CBCTbrainOptimumMASCalc(){
    double brainOptimumMAS = (55 * _circumference.toDouble()- 50) / 6;
    return brainOptimumMAS;
  }


  double CTBrainOptimumDose(){
    double opt_Kvp = 2 * _circumference.toDouble();
    double opt_mAs = 140 - _circumference.toDouble();
    double dose = 0;
    dose = (1 / (1.52 - 39.82 / _circumference)) * (opt_mAs / 100) * (opt_Kvp / 120) * (opt_Kvp / 120);
    return dose.toDouble();
  }
  double CTBrainReferralDose(){

    double dose = 0;
    dose = (1 / (1.52 - 39.82 / _circumference)) * (_refmAs / 100) * (_refkVp / 120) * (_refkVp / 120);
    return dose;

  }
  double CTBrainMaleOptimumRisk(){
    double risk = 0;
    if (_age >= 30) {
      risk = 1.0 + 0.0033 * CTBrainOptimumDose();
    } else if (_age < 30) {
      risk = 1.0 + 0.0033 * CTBrainOptimumDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk;
  }

  double CTBrainMaleReferralRisk(){
    double risk = 0;
    if (_age > 30) {
      risk = 1.0 + 0.0033 * CTBrainReferralDose();
    } else if (_age < 30) {
      risk = 1.0 + 0.0033 * CTBrainReferralDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk.toDouble();
  }

  double CTBrainFemaleOptimumRisk(){
    double risk = 0;
    if (_age >= 30) {
      risk = 1.0 + 0.0057 * CTBrainOptimumDose();
    } else if (_age < 30) {
      risk = 1.0 + 0.0057 * CTBrainOptimumDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk.toDouble();
  }

  double CTBrainFemaleReferralRisk(){
    double risk = 0;
    if (_age >= 30) {
      risk = 1.0 + 0.0057 * CTBrainReferralDose();
    } else if (_age < 30) {
      risk = 1.0 + 0.0057 * CTBrainReferralDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk.toDouble();
  }

  double CBCTBrainOptimumDose(){
    double brainOptimumKVP = (5 * _circumference - 100) / 3;
    double brainOptimumMAS = (55 * _circumference -50) / 6;

    double optimumDose = 0.0;

    optimumDose = 0.5 * ((5.61 - 0.035 * _weight + 0.000224 * _weight * _weight) +
        (6.94 + 0.0526 * _circumference - 0.00172 * _circumference * _circumference)) *
        (brainOptimumMAS / 720) * Math.exp(0.00938 * (brainOptimumKVP -100));
    return optimumDose.toDouble();
  }

  //Find out referral doses and change
  double CBCTBrainReferrallDose(){
    double referralDose = 0.0;
    referralDose = 0.5 * ((5.61 - 0.035 * _weight + 0.000224 * _weight * _weight) +
        (6.94 + 0.0526 * _circumference - 0.00172 * _circumference * _circumference)) *
        (_refmAs / 720) * Math.exp(0.00938 * (_refkVp -100));
    return referralDose;
  }
  //brain
  double CBCTMaleOptimumBrainRisk(){
    double risk = 0.0;

    if (_age >= 30) {
      risk = 1.0 + 0.0033 * CBCTBrainOptimumDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.0033 * CBCTBrainOptimumDose() * Math.exp(-0.03 * (_age - 30));
    }
    return risk;
  }
  double CBCTMaleReferralBrainRisk(){
    double risk = 0.0;

    if (_age >= 30) {
      risk = 1.0 + 0.0033 * CBCTBrainReferrallDose();
    } else if(_age < 30) {
      risk = 1.0 + 0.0033 * CBCTBrainReferrallDose() * Math.exp(-0.03 * (_age - 30));
    }
    return risk;
  }

  double CBCTFemaleOptimumBrainRisk(){
    double risk = 0.0;
    if (_age >= 30) {
      risk = 1.0 + 0.0057 * CBCTBrainOptimumDose();
    } else if(_age <= 30) {
      risk =  1.0 + 0.0057 * CBCTBrainOptimumDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk;
  }
  double CBCTFemaleReferralBrainRisk(){
    double risk = 0.0;
    if (_age >= 30) {
      risk = 1.0 + 0.0057 * CBCTBrainReferrallDose();
    } else if(_age <= 30) {
      risk =  1.0 + 0.0057* CBCTBrainReferrallDose() * Math.exp(-0.03 * (age - 30));
    }
    return risk;
  }




}