import 'package:equatable/equatable.dart';
import 'category_model.dart';

class ArticleModel extends Equatable {
  final String? id;
  final String title;
  final String? subtitle;
  final String content;
  final List<String> media; // List of image URLs
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String categoryId; // Foreign key to Category (always required)
  final CategoryModel?
      category; // Related category object (populated from joins)
  final int likeCount;
  final int commentsCount;

  const ArticleModel({
    this.id,
    required this.title,
    this.subtitle,
    required this.content,
    this.media = const [],
    required this.createdAt,
    required this.updatedAt,
    this.createdBy = "Admin",
    required this.categoryId,
    this.category,
    this.likeCount = 0,
    this.commentsCount = 0,
  });

  // Copy with method for immutability
  ArticleModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? content,
    List<String>? media,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
    String? categoryId,
    CategoryModel? category,
    int? likeCount,
    int? commentsCount,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      content: content ?? this.content,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      likeCount: likeCount ?? this.likeCount,
      commentsCount: commentsCount ?? this.commentsCount,
    );
  }

  // Method to increment like count
  ArticleModel incrementLikes() {
    return copyWith(likeCount: likeCount + 1);
  }

  // Method to decrement like count
  ArticleModel decrementLikes() {
    return copyWith(likeCount: likeCount > 0 ? likeCount - 1 : 0);
  }

  // Method to increment comment count
  ArticleModel incrementComments() {
    return copyWith(commentsCount: commentsCount + 1);
  }

  // Method to decrement comment count
  ArticleModel decrementComments() {
    return copyWith(commentsCount: commentsCount > 0 ? commentsCount - 1 : 0);
  }

  // Convenience method to get category title
  String get categoryTitle => category?.title ?? 'Uncategorized';

  // Convenience method to get category description
  String? get categoryDescription => category?.description;

  // Check if article has a category assigned
  bool get hasCategory => category != null;

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'media': media,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'createdBy': createdBy,
      'categoryId': categoryId,
      'likeCount': likeCount,
      'commentsCount': commentsCount,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      content: json['content'] ?? '',
      media: List<String>.from(json['media'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdBy: json['createdBy'] ?? 'Admin',
      categoryId: json['categoryId'] ?? '', // Always required
      category: json['category'] != null
          ? CategoryModel.fromJson(
              json['category']) // Populated when fetched with joins
          : null,
      likeCount: json['likeCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        content,
        media,
        createdAt,
        updatedAt,
        createdBy,
        categoryId,
        category,
        likeCount,
        commentsCount,
      ];

  @override
  String toString() {
    return 'ArticleModel(id: $id, title: $title, likes: $likeCount, comments: $commentsCount)';
  }
}
