import 'package:clean_architecture/src/core/failure.dart';
import 'package:clean_architecture/src/core/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../post.dart';
import '../post_repository.dart';

class GetPostById implements UseCase<Post, GetPostByIdParams> {
  final PostRepository repository;

  GetPostById(this.repository);

  @override
  Future<Either<Failure, Post>> call(GetPostByIdParams params) async {
    return await repository.getPost(params.id);
  }
}

class GetPostByIdParams extends Equatable {
  final int id;

  GetPostByIdParams({this.id});

  @override
  List<Object> get props => [id];
}
