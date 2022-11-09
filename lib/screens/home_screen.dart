import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_lessons/cubit/cubit.dart';
import 'package:http_lessons/model/post_model.dart';
import 'package:http_lessons/repositories/post_repo.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<DataCubit>().getData();
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ErrorState) {
            Center(
              child: Text(state.error),
            );
          }
          if (state is SuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => _ItemWidget(
                model: state.data[index],
              ),
              itemCount: state.data.length,
            );
          }
          return const Center(
            child: Text('Данных пока нет!'),
          );
        },
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({super.key, required this.model});

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        model.id.toString(),
        style: const TextStyle(
          height: 1.5,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        model.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        model.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
