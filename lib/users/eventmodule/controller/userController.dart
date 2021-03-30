import 'package:ed_tech/users/eventapi/usersapi.dart';
import 'package:ed_tech/users/eventmodule/models/User.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  var isLoading =true.obs;

  List<User> userList = List<User>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {

      isLoading(true);
      var response = await UsersApi.getUsers();
      if(response == null){
        print("HERE ALSOOOOO");
        Get.toNamed('/');
      }
      else if(response!=null){
        userList.assignAll(response);
      }
    }finally{
      isLoading(false);
    }
  }

}