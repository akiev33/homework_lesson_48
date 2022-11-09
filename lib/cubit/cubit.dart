import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_lessons/model/post_model.dart';
import 'package:http_lessons/repositories/post_repo.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit({required this.repo}) : super(InitialState());

  final PostRepo repo;

  Future<void> getData() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));

    final data = await repo.getPosts();

    if (data.isNotEmpty) {
      emit(SuccessState(data: data));
    } else {
      emit(ErrorState(error: 'Проверьте связь с интернетом!'));
    }
  }
}

abstract class DataState {}

class LoadingState extends DataState {}

class InitialState extends DataState {}

class SuccessState extends DataState {
  SuccessState({required this.data});
  final List<PostModel> data;
}

class ErrorState extends DataState {
  ErrorState({required this.error});
  final String error;
}
