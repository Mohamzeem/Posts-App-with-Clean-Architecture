import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/datasources/local_data_source.dart';
import '../../data/datasources/remorte_data_source.dart';
import '../../data/repositories/posts_repository.dart';

class PostRepositoryImpl implements PostsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PostRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    throw UnimplementedError();
  }
}
