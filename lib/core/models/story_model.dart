import 'package:equatable/equatable.dart';

class StoryModel extends Equatable {
  final String? id;
  final String name;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  const StoryModel({
    this.id,
    required this.name,
    this.lastMessage,
    this.lastMessageTime,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  StoryModel copyWith({
    String? id,
    String? name,
    String? lastMessage,
    DateTime? lastMessageTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Update last message
  StoryModel updateLastMessage(String message) {
    return copyWith(
      lastMessage: message,
      lastMessageTime: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  // Check if story has messages
  bool get hasMessages => lastMessage != null && lastMessage!.isNotEmpty;

  // Get time since last message
  Duration? get timeSinceLastMessage {
    if (lastMessageTime == null) return null;
    return DateTime.now().difference(lastMessageTime!);
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      name: json['name'] ?? '',
      lastMessage: json['lastMessage'],
      lastMessageTime: json['lastMessageTime'] != null
          ? DateTime.parse(json['lastMessageTime'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        lastMessage,
        lastMessageTime,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'StoryModel(id: $id, name: $name, hasMessages: $hasMessages)';
  }
}
