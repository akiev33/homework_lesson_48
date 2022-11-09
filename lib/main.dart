import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_lessons/cubit/cubit.dart';
import 'package:http_lessons/provider/post_provider.dart';
import 'package:http_lessons/repositories/post_repo.dart';
import 'package:http_lessons/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(repo: PostRepo()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomeScreen(),
      ),
    );
  }
}
