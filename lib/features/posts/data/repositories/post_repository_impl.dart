import 'package:posts/core/errors/exceptions.dart';
import 'package:posts/core/network/network_info.dart';
import 'package:posts/features/posts/data/models/post_model.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remorte_data_source.dart';
import '../../domain/repositories/posts_repository.dart';

typedef AddOrUpdateOrDeletePost = Future<Unit> Function();
// typedef Future<Unit> DeleteOrUpdateOrAddPost();

class PostRepositoryImpl implements PostsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(this.networkInfo,
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        await localDataSource.cachePosts(remotePosts);
        return right(remotePosts);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return right(localPosts);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() => remoteDataSource.addPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() => remoteDataSource.updatePost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMessage(() => remoteDataSource.deletePost(postId));
  }

  Future<Either<Failure, Unit>> _getMessage(
      AddOrUpdateOrDeletePost addOrUpdateorDeletepost) async {
    if (await networkInfo.isConnected) {
      try {
        await addOrUpdateorDeletepost();
        return right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
