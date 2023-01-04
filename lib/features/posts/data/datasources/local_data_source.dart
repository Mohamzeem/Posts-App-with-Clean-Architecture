import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModel);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<Unit> cachePosts(List<PostModel> postModel) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}
