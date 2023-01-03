import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/repositories/posts_repository.dart';
import '../../../../core/errors/failure.dart';
import '../entities/post.dart';

class UpdatePostUseCase {
  final PostsRepository repository;
  UpdatePostUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
