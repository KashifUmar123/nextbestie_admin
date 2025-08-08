import 'package:equatable/equatable.dart';

class IdentityModel extends Equatable {
  final String? id;
  final List<String> users; // List of user IDs (typically 2 users)
  final List<String>
      revealed; // List of user IDs who have revealed their identity
  final DateTime createdAt;
  final DateTime updatedAt;

  const IdentityModel({
    this.id,
    required this.users,
    this.revealed = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  IdentityModel copyWith({
    String? id,
    List<String>? users,
    List<String>? revealed,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return IdentityModel(
      id: id ?? this.id,
      users: users ?? this.users,
      revealed: revealed ?? this.revealed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Add user to revealed list
  IdentityModel revealIdentity(String userId) {
    if (revealed.contains(userId) || !users.contains(userId)) {
      return this;
    }

    final updatedRevealed = List<String>.from(revealed)..add(userId);
    return copyWith(
      revealed: updatedRevealed,
      updatedAt: DateTime.now(),
    );
  }

  // Remove user from revealed list
  IdentityModel hideIdentity(String userId) {
    if (!revealed.contains(userId)) {
      return this;
    }

    final updatedRevealed = List<String>.from(revealed)..remove(userId);
    return copyWith(
      revealed: updatedRevealed,
      updatedAt: DateTime.now(),
    );
  }

  // Check if user has revealed their identity
  bool isUserRevealed(String userId) {
    return revealed.contains(userId);
  }

  // Check if both users have revealed their identities
  bool get areBothRevealed {
    return users.length == 2 &&
        revealed.length == 2 &&
        users.every((user) => revealed.contains(user));
  }

  // Check if at least one user has revealed their identity
  bool get hasAnyRevealed {
    return revealed.isNotEmpty;
  }

  // Get the other user ID (for 2-user conversations)
  String? getOtherUserId(String currentUserId) {
    if (users.length != 2 || !users.contains(currentUserId)) {
      return null;
    }
    return users.firstWhere((user) => user != currentUserId);
  }

  // Check if user is part of this identity
  bool containsUser(String userId) {
    return users.contains(userId);
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users': users,
      'revealed': revealed,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory IdentityModel.fromJson(Map<String, dynamic> json) {
    return IdentityModel(
      id: json['id'],
      users: List<String>.from(json['users'] ?? []),
      revealed: List<String>.from(json['revealed'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        users,
        revealed,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'IdentityModel(id: $id, users: ${users.length}, revealed: ${revealed.length}/${users.length})';
  }
}
