import 'package:e_commerce_responsive/framework/utils/userBox.dart';
import 'package:e_commerce_responsive/ui/utils/consts/app_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';


import '../../../repository/auth/model/user.dart';
import '../../../repository/dashbord/repository/dashboard_provider.dart';

class SignUpController{

  static void addUser(User user)async{
    print(user.email);
    print(user.password);
    Box<User> userBox = Hive.box<User>('User_Box');


    userBox.put(user.email.toString().toLowerCase().trim(),user);
    print("data added");
  }

  Future<String> checkUser(String email,String password) async {
    Box<User> userBox = Hive.box<User>('User_Box');
    if(userBox.containsKey(email.toLowerCase().trim())){
      if(userBox.get(email.toLowerCase().trim())?.password ==password){
        return password_sucess;
      }else{
        return password_faild;
      }
    }
    return user_not_fount;
  }

  void addAllData(WidgetRef ref) async{
    await ref.read(dashboardProvider.notifier).addAllData();

  }
}
