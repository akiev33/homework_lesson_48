// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http_lessons/model/post_model.dart';
// import 'package:http_lessons/repositories/post_repo.dart';

// class PostProvider with ChangeNotifier {
//   PostProvider({required this.repo});

//   final PostRepo repo;
//   bool isLoading = false;
//   List<PostModel> posts = [];
//   String errorText = '';

//   void getPosts() async {
//     try {
//       isLoading = true;
//       notifyListeners();
//       final response = await repo.getPosts();
//       final data = json.decode(response.body) as List;
//       isLoading = false;
//       errorText = '';
//       posts = data.map((e) => PostModel.fromJson(e)).toList();

//       notifyListeners();
//     } catch (e) {
//       isLoading = false;
//       errorText = 'Problem in your network, check wifi connection';
//       notifyListeners();
//     }
//   }
// }
