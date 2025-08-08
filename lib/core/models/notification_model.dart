import 'package:equatable/equatable.dart';

enum NotificationType { article, newsletter }

class NotificationModel extends Equatable {
  final String? id;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isRead;

  const NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.type,
    this.payload = const {},
    required this.createdAt,
    required this.updatedAt,
    this.isRead = false,
  });

  // Copy with method for immutability
  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    NotificationType? type,
    Map<String, dynamic>? payload,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isRead: isRead ?? this.isRead,
    );
  }

  // Mark notification as read
  NotificationModel markAsRead() {
    return copyWith(isRead: true);
  }

  // Mark notification as unread
  NotificationModel markAsUnread() {
    return copyWith(isRead: false);
  }

  // Check if notification is for article
  bool get isArticleNotification => type == NotificationType.article;

  // Check if notification is for newsletter
  bool get isNewsletterNotification => type == NotificationType.newsletter;

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.name,
      'payload': payload,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isRead': isRead,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      type: NotificationType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => NotificationType.article,
      ),
      payload: Map<String, dynamic>.from(json['payload'] ?? {}),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isRead: json['isRead'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        type,
        payload,
        createdAt,
        updatedAt,
        isRead,
      ];

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, type: ${type.name}, isRead: $isRead)';
  }
}
