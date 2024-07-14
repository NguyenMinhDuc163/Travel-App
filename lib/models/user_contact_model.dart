class UserContactModel {
  String? name;
  String? phone;
  String? email;

  UserContactModel(this.name, this.phone, this.email);

  @override
  String toString() {
    return 'UserContactModel{name: $name, phone: $phone, email: $email}';
  }

  factory UserContactModel.fromJson(Map<String, dynamic> json) {
    return UserContactModel(
      json['name'],
      json['phone'],
      json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
