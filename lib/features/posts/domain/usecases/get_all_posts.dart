import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/repositories/posts_repository.dart';
import '../../../../core/errors/failure.dart';
import '../entities/post.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;
  GetAllPostsUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}
