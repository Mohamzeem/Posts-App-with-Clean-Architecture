import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPost(PostModel post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }
}
