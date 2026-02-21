class User {
  final int id;
  final String name;
  final String? email;
  final String? password;
  final String avatarPath;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    this.email,
    this.password,
    required this.avatarPath,
    required this.createdAt,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String?,
      password: map['password'] as String?,
      avatarPath: map['avatar_path'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'avatar_path': avatarPath,
      'created_at': createdAt,
    };
  }
}
