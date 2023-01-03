import 'package:dartz/dartz.dart';
import 'package:posts/features/posts/data/repositories/posts_repository.dart';
import '../../../../core/errors/failure.dart';

class DeletePostUseCase {
  final PostsRepository repository;
  DeletePostUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deletePost(id);
  }
}
