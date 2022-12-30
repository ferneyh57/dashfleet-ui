// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Permite alamcenar la info basica de las rutas.
///
enum RouteState {
  pending,
  completed,
  canceled,
}

class Routes {
  final String name;
  final double distance;
  final bool completed;
  Routes({
    required this.name,
    required this.distance,
    this.completed = false,
  });

  Routes copyWith({
    String? name,
    double? distance,
    bool? completed,
  }) {
    return Routes(
      name: name ?? this.name,
      distance: distance ?? this.distance,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'distance': distance,
      'completed': completed,
    };
  }

  factory Routes.fromMap(Map<String, dynamic> map) {
    return Routes(
      name: map['name'] as String,
      distance: map['distance'] as double,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Routes.fromJson(String source) =>
      Routes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Route(name: $name, distance: $distance, completed: $completed)';

  @override
  bool operator ==(covariant Routes other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.distance == distance &&
        other.completed == completed;
  }

  @override
  int get hashCode => name.hashCode ^ distance.hashCode ^ completed.hashCode;
}

/// Info basica de los usuarios.
class User {
  final String email;
  final String password;
  final String name;
  User({
    required this.email,
    required this.password,
    required this.name,
  });

  User copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(email: $email, password: $password, name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.name == name;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ name.hashCode;
}
