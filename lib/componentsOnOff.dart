import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// var finderOpen = Provider.of<OnOff>(context).getFinder;
// Provider.of<OnOff>(context, listen: false).toggleFinder();

class OnOff extends ChangeNotifier{
  bool finderOpen =false;
  bool ccOpen =true;

  bool get getFinder {
    return finderOpen;
  }

  void toggleFinder() {
    finderOpen= !finderOpen;
    notifyListeners();
  }

  bool get getCc {
    return ccOpen;
  }

  void toggleCc() {
    ccOpen= !ccOpen;
    notifyListeners();
  }
}