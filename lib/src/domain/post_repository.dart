import 'package:clean_architecture/src/core/failure.dart';
import 'package:dartz/dartz.dart';

import 'post.dart';

abstract class PostRepository {
  Future<Either<Failure, Post>> getPost(int number);
  Future<Either<Failure, List<Post>>> getAll();
}
