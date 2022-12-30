// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Permite alamcenar la info basica de las rutas.
class Route {
  final String name;
  final double distance;
  Route({
    required this.name,
    required this.distance,
  });

  Route copyWith({
    String? name,
    double? distance,
  }) {
    return Route(
      name: name ?? this.name,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'distance': distance,
    };
  }

  factory Route.fromMap(Map<String, dynamic> map) {
    return Route(
      name: map['name'] as String,
      distance: map['distance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Route.fromJson(String source) =>
      Route.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Route(name: $name, distance: $distance)';

  @override
  bool operator ==(covariant Route other) {
    if (identical(this, other)) return true;

    return other.name == name && other.distance == distance;
  }

  @override
  int get hashCode => name.hashCode ^ distance.hashCode;
}

/// Info basica de los usuarios.
class User {
  final String email;
  final String password;
  User({
    required this.email,
    required this.password,
  });

  User copyWith({
    String? email,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(email: $email, password: $password)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
