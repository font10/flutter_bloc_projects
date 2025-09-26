class SupabaseUser {
  final String id;
  final String email;
  final bool emailVerified;
  final DateTime createdAt;
  final DateTime? emailConfirmedAt;
  final DateTime? lastSignInAt;

  SupabaseUser({
    required this.id,
    required this.email,
    required this.emailVerified,
    required this.createdAt,
    this.emailConfirmedAt,
    this.lastSignInAt,
  });

  factory SupabaseUser.fromJson(Map<String, dynamic> json) {
    return SupabaseUser(
      id: json['id'],
      email: json['email'],
      emailVerified: json['user_metadata']?['email_verified'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      emailConfirmedAt: json['email_confirmed_at'] != null
          ? DateTime.parse(json['email_confirmed_at'])
          : null,
      lastSignInAt: json['last_sign_in_at'] != null
          ? DateTime.parse(json['last_sign_in_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'email_verified': emailVerified,
      'created_at': createdAt.toIso8601String(),
      'email_confirmed_at': emailConfirmedAt?.toIso8601String(),
      'last_sign_in_at': lastSignInAt?.toIso8601String(),
    };
  }
}