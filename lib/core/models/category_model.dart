import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CategoryModel({
    this.id,
    required this.title,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  CategoryModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, description: $description)';
  }
}
