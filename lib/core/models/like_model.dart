import 'package:equatable/equatable.dart';

class LikeModel extends Equatable {
  final String? id;
  final String likedBy; // Foreign key to User
  final String? articleId; // Foreign key to Article (optional for flexibility)
  final String?
      newsletterId; // Foreign key to Newsletter (optional for flexibility)
  final DateTime createdAt;
  final DateTime updatedAt;

  const LikeModel({
    this.id,
    required this.likedBy,
    this.articleId,
    this.newsletterId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  LikeModel copyWith({
    String? id,
    String? likedBy,
    String? articleId,
    String? newsletterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LikeModel(
      id: id ?? this.id,
      likedBy: likedBy ?? this.likedBy,
      articleId: articleId ?? this.articleId,
      newsletterId: newsletterId ?? this.newsletterId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Check if this like is for an article
  bool get isArticleLike => articleId != null;

  // Check if this like is for a newsletter
  bool get isNewsletterLike => newsletterId != null;

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'likedBy': likedBy,
      'articleId': articleId,
      'newsletterId': newsletterId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      id: json['id'],
      likedBy: json['likedBy'] ?? '',
      articleId: json['articleId'],
      newsletterId: json['newsletterId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        likedBy,
        articleId,
        newsletterId,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    String target =
        articleId != null ? 'article:$articleId' : 'newsletter:$newsletterId';
    return 'LikeModel(id: $id, likedBy: $likedBy, target: $target)';
  }
}
