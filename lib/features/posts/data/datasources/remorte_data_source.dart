import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:posts/core/errors/exceptions.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

import '../../../../core/strings/app_strings.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse('${AppStrings.baseUrl}/posts/'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels =
          decodedJson.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel post) async {
    final postBody = {'title': post.title, 'body': post.body};
    final response = await client
        .post(Uri.parse('${AppStrings.baseUrl}/posts/'), body: postBody);
    if (response.statusCode == 201) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel post) async {
    final postId = post.id.toString();
    final postBody = {'title': post.title, 'body': post.body};
    final response = await client
        .patch(Uri.parse('${AppStrings.baseUrl}/post/$postId'), body: postBody);
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    final response = await client.delete(
      Uri.parse('${AppStrings.baseUrl}/post/$id'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}
