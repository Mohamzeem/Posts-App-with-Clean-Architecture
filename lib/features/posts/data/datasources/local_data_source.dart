// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:posts/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:posts/features/posts/data/models/post_model.dart';
import '../../../../core/strings/app_strings.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModel);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<Unit> cachePosts(List<PostModel> postModel) async {
    List postModelsToJson =
        postModel.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString(
        AppStrings.cashedPosts, json.encode(postModelsToJson));
    return unit;
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final dynamic jsonDataString =
        sharedPreferences.get(AppStrings.cashedPosts);
    if (jsonDataString != null) {
      List decodedJsonData = json.decode(jsonDataString);
      List<PostModel> jsonToPostModels =
          decodedJsonData.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
