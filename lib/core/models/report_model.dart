import 'package:equatable/equatable.dart';

enum ReportReason {
  spam,
  harassment,
  inappropriateContent,
  fakeProfile,
  suspiciousActivity,
  abusiveBehavior,
  scam,
  other,
}

enum ReportStatus {
  pending,
  underReview,
  resolved,
  dismissed,
}

class ReportModel extends Equatable {
  final String? id;
  final String reporterId; // Foreign key to User (who is reporting)
  final String reportedUserId; // Foreign key to User (who is being reported)
  final ReportReason reason; // Reason for reporting
  final String description; // Detailed description of the issue
  final String? messageId; // Optional: specific message being reported
  final String? conversationId; // Optional: conversation context
  final List<String> evidence; // Optional: screenshots or evidence URLs
  final ReportStatus status; // Status of the report
  final String? adminNotes; // Admin's notes on the report
  final String? adminId; // Admin who handled the report
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReportModel({
    this.id,
    required this.reporterId,
    required this.reportedUserId,
    required this.reason,
    required this.description,
    this.messageId,
    this.conversationId,
    this.evidence = const [],
    this.status = ReportStatus.pending,
    this.adminNotes,
    this.adminId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  ReportModel copyWith({
    String? id,
    String? reporterId,
    String? reportedUserId,
    ReportReason? reason,
    String? description,
    String? messageId,
    String? conversationId,
    List<String>? evidence,
    ReportStatus? status,
    String? adminNotes,
    String? adminId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReportModel(
      id: id ?? this.id,
      reporterId: reporterId ?? this.reporterId,
      reportedUserId: reportedUserId ?? this.reportedUserId,
      reason: reason ?? this.reason,
      description: description ?? this.description,
      messageId: messageId ?? this.messageId,
      conversationId: conversationId ?? this.conversationId,
      evidence: evidence ?? this.evidence,
      status: status ?? this.status,
      adminNotes: adminNotes ?? this.adminNotes,
      adminId: adminId ?? this.adminId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Admin actions
  ReportModel markAsUnderReview(String adminId) {
    return copyWith(
      status: ReportStatus.underReview,
      adminId: adminId,
      updatedAt: DateTime.now(),
    );
  }

  ReportModel markAsResolved(String adminId, String? adminNotes) {
    return copyWith(
      status: ReportStatus.resolved,
      adminId: adminId,
      adminNotes: adminNotes,
      updatedAt: DateTime.now(),
    );
  }

  ReportModel markAsDismissed(String adminId, String? adminNotes) {
    return copyWith(
      status: ReportStatus.dismissed,
      adminId: adminId,
      adminNotes: adminNotes,
      updatedAt: DateTime.now(),
    );
  }

  // Add admin notes
  ReportModel addAdminNotes(String adminId, String notes) {
    return copyWith(
      adminId: adminId,
      adminNotes: notes,
      updatedAt: DateTime.now(),
    );
  }

  // Check if report is pending action
  bool get isPending => status == ReportStatus.pending;

  // Check if report is under review
  bool get isUnderReview => status == ReportStatus.underReview;

  // Check if report is resolved
  bool get isResolved => status == ReportStatus.resolved;

  // Check if report is dismissed
  bool get isDismissed => status == ReportStatus.dismissed;

  // Check if report has evidence
  bool get hasEvidence => evidence.isNotEmpty;

  // Check if report is about a specific message
  bool get isMessageReport => messageId != null;

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reporterId': reporterId,
      'reportedUserId': reportedUserId,
      'reason': reason.name,
      'description': description,
      'messageId': messageId,
      'conversationId': conversationId,
      'evidence': evidence,
      'status': status.name,
      'adminNotes': adminNotes,
      'adminId': adminId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      reporterId: json['reporterId'] ?? '',
      reportedUserId: json['reportedUserId'] ?? '',
      reason: ReportReason.values.firstWhere(
        (e) => e.name == json['reason'],
        orElse: () => ReportReason.other,
      ),
      description: json['description'] ?? '',
      messageId: json['messageId'],
      conversationId: json['conversationId'],
      evidence: List<String>.from(json['evidence'] ?? []),
      status: ReportStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReportStatus.pending,
      ),
      adminNotes: json['adminNotes'],
      adminId: json['adminId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        reporterId,
        reportedUserId,
        reason,
        description,
        messageId,
        conversationId,
        evidence,
        status,
        adminNotes,
        adminId,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'ReportModel(id: $id, reason: ${reason.name}, status: ${status.name}, reporter: $reporterId, reported: $reportedUserId)';
  }
}
