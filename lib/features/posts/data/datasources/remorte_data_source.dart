import 'package:dartz/dartz.dart';
import '../../domain/entities/post.dart';

abstract class RemoteDataSource {
  Future<List<Post>> getAllPosts();
  Future<Unit> addPost(Post post);
  Future<Unit> updatePost(Post post);
  Future<Unit> deletePost(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Unit> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
