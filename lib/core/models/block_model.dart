import 'package:equatable/equatable.dart';

class BlockModel extends Equatable {
  final String? id;
  final String blockerId; // Foreign key to User (who is blocking)
  final String blockedUserId; // Foreign key to User (who is being blocked)
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive; // Allow soft unblocking

  const BlockModel({
    this.id,
    required this.blockerId,
    required this.blockedUserId,
    required this.createdAt,
    required this.updatedAt,
    this.isActive = true,
  });

  // Copy with method for immutability
  BlockModel copyWith({
    String? id,
    String? blockerId,
    String? blockedUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
  }) {
    return BlockModel(
      id: id ?? this.id,
      blockerId: blockerId ?? this.blockerId,
      blockedUserId: blockedUserId ?? this.blockedUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  // Block user (activate the block)
  BlockModel block() {
    return copyWith(
      isActive: true,
      updatedAt: DateTime.now(),
    );
  }

  // Unblock user (deactivate the block)
  BlockModel unblock() {
    return copyWith(
      isActive: false,
      updatedAt: DateTime.now(),
    );
  }

  // Static helper methods for messaging functionality

  // Check if user is blocked from messaging another user
  static bool isUserBlocked(
      List<BlockModel> blocks, String blockerId, String blockedUserId) {
    return blocks.any((block) =>
        block.blockerId == blockerId &&
        block.blockedUserId == blockedUserId &&
        block.isActive);
  }

  // Check if messaging is blocked between two users (either direction)
  static bool isMessagingBlocked(
      List<BlockModel> blocks, String user1Id, String user2Id) {
    return isUserBlocked(blocks, user1Id, user2Id) ||
        isUserBlocked(blocks, user2Id, user1Id);
  }

  // Get all users blocked by a specific user (can't receive messages from them)
  static List<String> getBlockedUserIds(
      List<BlockModel> blocks, String blockerId) {
    return blocks
        .where((block) => block.blockerId == blockerId && block.isActive)
        .map((block) => block.blockedUserId)
        .toList();
  }

  // Get all users who blocked a specific user (user can't message them)
  static List<String> getBlockerIds(
      List<BlockModel> blocks, String blockedUserId) {
    return blocks
        .where(
            (block) => block.blockedUserId == blockedUserId && block.isActive)
        .map((block) => block.blockerId)
        .toList();
  }

  // Check if two users can message each other
  static bool canMessage(
      List<BlockModel> blocks, String senderId, String receiverId) {
    return !isMessagingBlocked(blocks, senderId, receiverId);
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'blockerId': blockerId,
      'blockedUserId': blockedUserId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(
      id: json['id'],
      blockerId: json['blockerId'] ?? '',
      blockedUserId: json['blockedUserId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  @override
  List<Object?> get props => [
        id,
        blockerId,
        blockedUserId,
        createdAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'BlockModel(id: $id, blocker: $blockerId, blocked: $blockedUserId, active: $isActive)';
  }
}
