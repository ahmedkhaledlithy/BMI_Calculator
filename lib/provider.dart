import 'dart:math';

import 'package:flutter/material.dart';

class BmiProvider extends ChangeNotifier{

   bool isMale=true;
   double height=80;
   int weight=40;
   int age=15;
   double? result;

  toggleMaleOrFemale(bool choose){
    isMale=choose;
    notifyListeners();
  }

  changeHeight(value){
    height=value;
    notifyListeners();
  }

  addWeight(){
    weight++;
    notifyListeners();
  }

  lessWeight(){
    if(weight>40){
      weight--;
    }
    notifyListeners();
  }

  addAge(){
    age++;
    notifyListeners();
  }

  lessAge(){
    if(age>15){
      age--;
    }
    notifyListeners();
  }

  calculateBMI(){
    result= weight/pow(height/100, 2);
    notifyListeners();
  }
}