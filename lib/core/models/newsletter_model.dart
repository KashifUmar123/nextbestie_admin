import 'package:equatable/equatable.dart';

class NewsletterModel extends Equatable {
  final String? id;
  final String title;
  final String content;
  final List<String> media; // List of image URLs
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentsCount;

  const NewsletterModel({
    this.id,
    required this.title,
    required this.content,
    this.media = const [],
    required this.createdAt,
    required this.updatedAt,
    this.commentsCount = 0,
  });

  // Copy with method for immutability
  NewsletterModel copyWith({
    String? id,
    String? title,
    String? content,
    List<String>? media,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? commentsCount,
  }) {
    return NewsletterModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      commentsCount: commentsCount ?? this.commentsCount,
    );
  }

  // Method to increment comment count
  NewsletterModel incrementComments() {
    return copyWith(commentsCount: commentsCount + 1);
  }

  // Method to decrement comment count
  NewsletterModel decrementComments() {
    return copyWith(commentsCount: commentsCount > 0 ? commentsCount - 1 : 0);
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'media': media,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'commentsCount': commentsCount,
    };
  }

  factory NewsletterModel.fromJson(Map<String, dynamic> json) {
    return NewsletterModel(
      id: json['id'],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      media: List<String>.from(json['media'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      commentsCount: json['commentsCount'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        media,
        createdAt,
        updatedAt,
        commentsCount,
      ];

  @override
  String toString() {
    return 'NewsletterModel(id: $id, title: $title, comments: $commentsCount)';
  }
}
