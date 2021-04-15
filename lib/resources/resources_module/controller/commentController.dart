import 'package:ed_tech/resources/resources_api/comment_api.dart';
import 'package:ed_tech/resources/resources_module/models/comments.dart';

import 'package:get/get.dart';

class CommentController extends GetxController {
  var isLoading = true.obs;

  List<Comment> resList = List<Comment>.empty(growable: true).obs;
  var isVisible = false.obs;
  var res_id = 0.obs;

  @override
  void onInit() {
    fetchComments();
    super.onInit();
  }

  void fetchComments() async {
    try {
      isLoading(true);
      var response = await CommentApi.getComments(res_id.value);
      if (response == null) {
        print("Get Comments from Controller page");
        Get.toNamed('/resource');
      } else if (response != null) {
        resList.assignAll(response);
      }
    } finally {
      isLoading(false);
    }
  }
}
