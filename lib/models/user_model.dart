class UserModel {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String? phone;
  final String? city;
  final String? loginAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.phone = '-',
    this.city = '-',
    this.loginAt = '-',
  });

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
        id: json['_id'] as int?,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String?,
        city: json['city'] as String?,
        loginAt: json['loginAt'] as String?,
      );

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'city': city,
      'loginAt': loginAt,
    };
  }

  UserModel copy({
    int? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? city,
    String? loginAt,
  }) =>
      UserModel(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          password: password ?? this.password,
          phone: phone ?? this.phone,
          city: city ?? this.city,
          loginAt: loginAt ?? this.loginAt);

  @override
  String toString() {
    return 'id: $id, name: $name, email: $email, , password: $password, phone: $phone, city: $city, loginAt: $loginAt';
  }
}
