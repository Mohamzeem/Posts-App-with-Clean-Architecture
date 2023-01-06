import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/domain/repositories/posts_repository.dart';
import '../../../../core/errors/failure.dart';
import '../entities/post.dart';

class AddPostUseCase {
  final PostsRepository repository;
  AddPostUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
