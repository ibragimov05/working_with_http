class User {
  final int userId;
  final String userEmail;
  final String userPassword;
  final String userRole;
  final String userAvatar;
  final String creationAt;
  final String updatedAt;

  User({
    required this.userId,
    required this.userEmail,
    required this.userPassword,
    required this.userRole,
    required this.userAvatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'],
      userEmail: json['email'],
      userPassword: json['password'],
      userRole: json['role'],
      userAvatar: json['avatar'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
