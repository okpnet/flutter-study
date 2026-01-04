class UserEntity {
  final String id;
  final String name;
  final String email;
  final bool emailVerify;
  final String? firstName;
  final String? lastName;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerify,
    this.firstName,
    this.lastName,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerify: json['email_verify'] as bool,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verify': emailVerify,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, email: $email, emailVerify: $emailVerify, firstName: $firstName, lastName: $lastName}';
  }
}