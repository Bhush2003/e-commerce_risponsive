import '../../../repository/auth/model/user.dart';
import '../../single_tone_hive_object.dart';

class SignUpController{

  static void addUser(User user)async{
    print("true");
    final userBox=await SingleToneHiveObject().userBox;
    userBox.put(user.email.trim(),user);

  }
}