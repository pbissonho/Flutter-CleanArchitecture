import 'package:clean_architecture/src/domain/post_repository.dart';
import 'package:clean_architecture/src/presentation/post/bloc/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:koin/koin.dart';

import 'data/datasources/post_local_data_source.dart';
import 'data/datasources/post_remote_data_source.dart';
import 'data/repositories/rest_post_repository.dart';
import 'domain/usecases/get_post_by_id.dart';

var dio = Dio();
var local = PostLocalDataSource();
var remote = PostRemoteDataSource(dio);

var postRepository = PostRepositoryImpl(local, remote);

var postModule = Module()
  ..single((s, p) => PostRemoteDataSource(dio))
  ..factory((s, p) => GetPostById(postRepository))
  ..factory((s, p) => PostBloc(s.get()))
  ..single<PostRepository>((s, p) => postRepository);
