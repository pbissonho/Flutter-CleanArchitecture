import 'package:clean_architecture/src/core/failure.dart';
import 'package:clean_architecture/src/domain/post.dart';
import 'package:clean_architecture/src/domain/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSource _postLocalDataSource;
  final PostRemoteDataSource _postRemoteDataSource;

  PostRepositoryImpl(this._postLocalDataSource, this._postRemoteDataSource);

  Future<Either<Failure, Post>> getPost(int id) async {
    var post = await _postRemoteDataSource.getPost(id);
    return Right(post);
  }

  Future<Either<Failure, List<Post>>> getAll() async {
    var posts = await _postRemoteDataSource.getPosts();
    return Right(posts);
  }
}
