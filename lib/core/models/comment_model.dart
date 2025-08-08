import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String? id;
  final String comment;
  final String userId; // Foreign key to User
  final String articleId; // Foreign key to Article
  final DateTime createdAt;
  final DateTime updatedAt;

  const CommentModel({
    this.id,
    required this.comment,
    required this.userId,
    required this.articleId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  CommentModel copyWith({
    String? id,
    String? comment,
    String? userId,
    String? articleId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommentModel(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      articleId: articleId ?? this.articleId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'userId': userId,
      'articleId': articleId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comment: json['comment'] ?? '',
      userId: json['userId'] ?? '',
      articleId: json['articleId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        comment,
        userId,
        articleId,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'CommentModel(id: $id, userId: $userId, articleId: $articleId, comment: ${comment.length > 50 ? "${comment.substring(0, 50)}..." : comment})';
  }
}
