import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{
  bool isRightDoorLocked = true;
  bool isLeftDoorLocked = true;
  bool isTopDoorLocked = true;
  bool isBottomDoorLocked = true;
  int selectedBottomTab =0;
  bool isCoolSelected = false;
  bool tyreController = false;
  bool tyreStatusController =false;

  void updateSelectedBottomTab(int index){
    selectedBottomTab =index ;
    notifyListeners();
  }


  void updateRightDoorLocked(){
    isRightDoorLocked = !isRightDoorLocked;
    notifyListeners();
  }

    void updateLefttDoorLocked(){
    isLeftDoorLocked = !isLeftDoorLocked;
    print('the left should work');
    notifyListeners();
  }

      void updateToptDoorLocked(){
    isTopDoorLocked = !isTopDoorLocked;
    notifyListeners();
  }

 void updateBottomtDoorLocked(){
    isBottomDoorLocked = !isBottomDoorLocked;
    notifyListeners();
  }


  void updateCoolSelected(){
    isCoolSelected =!isCoolSelected;
    notifyListeners();
  }

  void updateTypeController(int index){
    if(selectedBottomTab !=3 && index ==3){
      Future.delayed(Duration(milliseconds: 400),(){

       tyreController = true;
      notifyListeners();   
      });
    
    }else{
      tyreController = false;
      notifyListeners();
    }

  }

  
  void updateTyreController(int index){
    if(selectedBottomTab !=3 && index ==3){
      Future.delayed(Duration(milliseconds: 400),(){

       tyreStatusController = true;
      notifyListeners();   
      });
    
    }else{
      tyreStatusController = false;
      notifyListeners();
    }

  }
}