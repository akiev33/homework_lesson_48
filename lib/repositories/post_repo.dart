import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http_lessons/cubit/cubit.dart';
import 'package:http_lessons/model/post_model.dart';

class PostRepo {
  Future<List<PostModel>> getPosts() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final response = await http.get(url);
      final dataMap = json.decode(response.body) as List;
      return dataMap.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
