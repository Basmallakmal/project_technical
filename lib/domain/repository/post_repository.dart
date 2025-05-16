import 'package:project_technical/domain/model/api_response.dart';
import 'package:project_technical/domain/model/list_reponse_model.dart';
import 'package:project_technical/domain/model/post_model.dart';

abstract class PostRepository {
  Future<ApiResponse<ListResponseModel<PostModel>>> getPosts({
    required String path,
  });

  List<PostModel> getCachePosts();

  Future<dynamic> fillCachePosts(List<PostModel> posts);
}
