class AppUser {
  String name;
  String email;
  String id;

  AppUser({
    required this.name,
    required this.email,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      name: map['name'],
      email: map['email'],
      id: map['id'],
    );
  }
}
