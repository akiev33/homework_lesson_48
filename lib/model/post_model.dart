// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      body: data['body'] ?? '',
    );
  }

  @override
  String toString() => 'PostModel(id: $id, title: $title, body: $body)';
}
