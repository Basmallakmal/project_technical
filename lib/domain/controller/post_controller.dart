import 'package:hive_ce/hive.dart';
import 'package:project_technical/config/network/networking.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/domain/model/api_response.dart';
import 'package:project_technical/domain/model/list_reponse_model.dart';
import 'package:project_technical/domain/model/post_model.dart';
import 'package:project_technical/domain/repository/post_repository.dart';

class PostController extends PostRepository {
  @override
  Future<ApiResponse<ListResponseModel<PostModel>>> getPosts({
    required String path,
  }) async {
    return ApiConstant().request(
      path: path,
      method: MethodType.get,
      fromJsonT: (json) => ListResponseModel<PostModel>.fromJson(
        json,
        (json) => PostModel.fromJson(json),
      ),
    );
  }

  @override
  List<PostModel> getCachePosts() {
    var box = Hive.box<PostModel>(AppSession.hivePostData);
    return box.values.toList();
  }

  @override
  Future fillCachePosts(List<PostModel> posts) async {
    var box = Hive.box<PostModel>(AppSession.hivePostData);
    await box.clear();
    return box.addAll(posts);
  }
}
