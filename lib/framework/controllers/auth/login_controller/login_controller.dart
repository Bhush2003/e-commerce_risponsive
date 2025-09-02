import 'package:flutter/cupertino.dart';

import '../../../repository/auth/model/user.dart';
import '../../single_tone_hive_object.dart';

class LoginController{

  dynamic checkUser(String email,String password) async {
    final userBox=SingleToneHiveObject().userBox;
    await userBox.keys.map((key){
      if(key==email.trim()){
        final value=userBox.get(key);
        if(value["email"]==email && value["password"]==password){
          return true;
        }
      }
    });
    print("false");
    return false;
  }

  Future<bool> checkEmail(User user) async {
    final userBox=SingleToneHiveObject().userBox;
    await userBox.keys.map((key){
      final value=userBox.get(key);
      if(value["email"]==user.email){
        return true;
      }
    });
    return false;
  }

}