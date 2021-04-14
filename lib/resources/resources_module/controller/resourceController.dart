import 'package:ed_tech/resources/resources_api/resource_api.dart';
import 'package:ed_tech/resources/resources_module/models/resources.dart';
import 'package:get/get.dart';

class ResourceController extends GetxController{
  var isLoading =true.obs;

  List<Resource> userList = List<Resource>.empty(growable: true).obs;
  var isVisible = false.obs;

  @override
  void onInit() {
    fetchResources();
    super.onInit();
  }

  void fetchResources() async {
    try {

      isLoading(true);
      var response = await ResourceApi.getResources();
      if(response == null){
        print("Get Resources from Controller page");
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