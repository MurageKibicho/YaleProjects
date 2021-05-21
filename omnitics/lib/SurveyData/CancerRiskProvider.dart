import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancerRiskData extends ChangeNotifier {
  bool _isMenuOpen = false;
  String _bodyPart = 'Head';
  String _riskCategory = 'High';
  double _estimatedRisk = 0.0;
  double _publicRisk = 0.0;
  Color _riskColor = Colors.white;
  double _screenPosition = 0.0;

  get isMenuOpen => _isMenuOpen;
  set isMenuOpen(value){
    _isMenuOpen = value;
    notifyListeners();
  }

  void setMenuOpen() {
    _isMenuOpen = !_isMenuOpen;
    notifyListeners();
  }

  get bodyPart => _bodyPart;
  set bodyPart(value){
    _bodyPart = value;
    notifyListeners();
  }

  void setBodyPart(String value) {
    _bodyPart = value;
    notifyListeners();
  }

  get riskCategory => _riskCategory;
  set riskCategory(value){
    _riskCategory = value;
    notifyListeners();
  }

  void setRiskCategory(String value) {
    _riskCategory = value;
    notifyListeners();
  }

  get estimatedRisk => _estimatedRisk;
  set estimatedRisk(value){
    _estimatedRisk = value;
    notifyListeners();
  }

  void setEstimatedRisk(double value) {
    _estimatedRisk = value;
    notifyListeners();
  }

  get publicRisk => _publicRisk;
  set publicRisk(value){
    _publicRisk = value;
    notifyListeners();
  }

  void setPublicRisk(double value) {
    _publicRisk = value;
    notifyListeners();
  }

  get screenPosition => _screenPosition;
  set screenPosition(value){
    _screenPosition = value;
    notifyListeners();
  }

  void setScreenPosition(double value) {
    _screenPosition = value;
    notifyListeners();
  }

  get riskColor => _riskColor;
  set riskColor(value){
    _riskColor = value;
    notifyListeners();
  }

  void setRiskColor(Color value) {
    _riskColor = value;
    notifyListeners();
  }
}