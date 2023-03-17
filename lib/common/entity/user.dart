import 'dart:convert';

class User {
  final String? username;
  final int age;
  final String? description;
  final int userId;

  User(
      {this.username,
      required this.age,
      this.description,
      required this.userId});

  factory User.fromJson(String jsonString) {
    Map<String, dynamic> userData = json.decode(jsonString);
    return User(
      username: userData['username'],
      age: userData['age'],
      description: userData['description'],
      userId: userData['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (username != null) 'username': username,
      'age': age,
      if (description != null) 'description': description,
      'userId': userId,
    };
  }
}
