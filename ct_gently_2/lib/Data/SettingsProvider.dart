import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  bool _isDialogBoxOpen = false;
  String _dialogBoxTitle = "Title";
  List<Widget> _listScrollView = [];
  double _scrollViewItemsExtent = 0;
  double _scrollHeight = 0;
  double _scrollWidth = 0;
  int  _setValue = 0;


  get isDialogBoxOpen => _isDialogBoxOpen;
  set isDialogBoxOpen(value){
    _isDialogBoxOpen = value;
    notifyListeners();
  }

  void setDialogBox(bool result)
  {
    _isDialogBoxOpen = result;
    notifyListeners();
  }

  get dialogBoxTitle => _dialogBoxTitle;
  set dialogBoxTitle(value){
    _dialogBoxTitle = value;
    notifyListeners();
  }

  void setDialogBoxTitle(String title)
  {
    _dialogBoxTitle = title;
    notifyListeners();
  }

  get listScrollView => _listScrollView;
  set listScrollView(value){
    _listScrollView = value;
    notifyListeners();
  }

  void setListScrollView(List<Widget> widgets)
  {
    _listScrollView = widgets;
    notifyListeners();
  }

  get scrollViewItemsExtent => _scrollViewItemsExtent;
  set scrollViewItemsExtent(value){
    _scrollViewItemsExtent = value;
    notifyListeners();
  }

  void setScrollViewItemsExtent(double value)
  {
    _scrollViewItemsExtent = value;
    notifyListeners();
  }

  get setValue => _setValue;
  set setValue(value){
    _setValue = value;
    notifyListeners();
  }

  void setValueFunction(int setFunction) {
    _setValue = setFunction;
    notifyListeners();
  }

  get scrollHeight => _scrollHeight;
  set scrollHeight(value){
    _scrollHeight = value;
    notifyListeners();
  }

  void setScrollHeight(double value)
  {
    _scrollHeight = value;
    notifyListeners();
  }

  get scrollWidth => _scrollWidth;
  set scrollWidth(value){
    _scrollWidth = value;
    notifyListeners();
  }

  void setScrollWidth(double value)
  {
    _scrollWidth = value;
    notifyListeners();
  }

}