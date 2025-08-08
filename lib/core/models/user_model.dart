import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String uid;
  final List<String> tokens;
  final String? profileImage;
  final List<String> imagesGallery;
  final String? address;
  final double? latitude;
  final double? longitude;
  final bool verified;
  final bool isPhoneVerified;
  final String gender;
  final String? phone;
  final String? countryCode; // Added country code field
  final bool quizDone;
  final List<String> profileTags;
  final bool isPrivate;
  final bool blockedByAdmin;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
    this.tokens = const [],
    this.profileImage,
    this.imagesGallery = const [],
    this.address,
    this.latitude,
    this.longitude,
    this.verified = false,
    this.isPhoneVerified = false,
    required this.gender,
    this.phone,
    this.countryCode, // Added country code parameter
    this.quizDone = false,
    this.profileTags = const [],
    this.isPrivate = false,
    this.blockedByAdmin = false,
  });

  // Full name getter for convenience
  String get fullName => name;

  // Copy with method for immutability
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? uid,
    List<String>? tokens,
    String? profileImage,
    List<String>? imagesGallery,
    String? address,
    double? latitude,
    double? longitude,
    bool? verified,
    bool? isPhoneVerified,
    String? gender,
    String? phone,
    String? countryCode, // Added country code parameter
    bool? quizDone,
    List<String>? profileTags,
    bool? isPrivate,
    bool? blockedByAdmin,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      uid: uid ?? this.uid,
      tokens: tokens ?? this.tokens,
      profileImage: profileImage ?? this.profileImage,
      imagesGallery: imagesGallery ?? this.imagesGallery,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      verified: verified ?? this.verified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      countryCode:
          countryCode ?? this.countryCode, // Added country code assignment
      quizDone: quizDone ?? this.quizDone,
      profileTags: profileTags ?? this.profileTags,
      isPrivate: isPrivate ?? this.isPrivate,
      blockedByAdmin: blockedByAdmin ?? this.blockedByAdmin,
    );
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'uid': uid,
      'tokens': tokens,
      'profileImage': profileImage,
      'imagesGallery': imagesGallery,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'verified': verified,
      'isPhoneVerified': isPhoneVerified,
      'gender': gender,
      'phone': phone,
      'countryCode': countryCode, // Added country code to JSON
      'quizDone': quizDone,
      'profileTags': profileTags,
      'isPrivate': isPrivate,
      'blockedByAdmin': blockedByAdmin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      uid: json['uid'] ?? '',
      tokens: List<String>.from(json['tokens'] ?? []),
      profileImage: json['profileImage'],
      imagesGallery: List<String>.from(json['imagesGallery'] ?? []),
      address: json['address'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      verified: json['verified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      gender: json['gender'] ?? '',
      phone: json['phone'],
      countryCode: json['countryCode'], // Added country code from JSON
      quizDone: json['quizDone'] ?? false,
      profileTags: List<String>.from(json['profileTags'] ?? []),
      isPrivate: json['isPrivate'] ?? false,
      blockedByAdmin: json['blockedByAdmin'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        createdAt,
        updatedAt,
        uid,
        tokens,
        profileImage,
        imagesGallery,
        address,
        latitude,
        longitude,
        verified,
        isPhoneVerified,
        gender,
        phone,
        countryCode, // Added country code to props
        quizDone,
        profileTags,
        isPrivate,
        blockedByAdmin,
      ];

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, verified: $verified)';
  }
}
