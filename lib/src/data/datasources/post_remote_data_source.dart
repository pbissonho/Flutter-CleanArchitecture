import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/post_model.dart';
class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<PostModel> getPost(int id) async {
    try {
      var response = await dio.get("/posts/$id");

      return PostModel.fromJson(json.decode(response.data));
    } catch (error) {
      throw "ServerException";
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      var response = await dio.get("/posts");

      var posts = (response.data as List)
          .map((data) => PostModel.fromJson(json.decode(response.data)))
          .toList();

      return posts;
    } catch (error) {
      throw "ServerException";
    }
  }
}
