import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import '../../../../core/errors/failure.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> addPost(Post post);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> deletePost(int id);
}
