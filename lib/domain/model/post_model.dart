import 'package:hive_ce_flutter/hive_flutter.dart';

class PostModel extends HiveObject{
  final String id;
  final String title;

  PostModel({
    required this.id,
    required this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'PostModel{id: $id, title: $title}';
  }
}
