class UserModel {
  String? userName;
  String? phoneNum;
  String? email;
  String? password;

  UserModel({
    this.userName,
    this.phoneNum,
    this.email,
    this.password,
  });


  @override
  String toString() {
    return 'UserModel{userName: $userName, phoneNum: $phoneNum, email: $email, password: $password}';
  }

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      userName: data['userName'],
      phoneNum: data['phoneNum'],
      email: data['email'],
      password: data['password'],
    );
  }
}