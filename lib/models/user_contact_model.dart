class UserContactModel {
  String? name;
  String? phone;
  String? email;

  UserContactModel(this.name, this.phone, this.email);

  @override
  String toString() {
    return 'UserContactModel{name: $name, phone: $phone, email: $email}';
  }
}
