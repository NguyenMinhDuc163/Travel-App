import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/user_auth/fiirebase_auth_immplemmentation/firebase_auth_services.dart';
import '../global/common/toast.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/core/helpers/image_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? selectedValue = 'Vietnamese';
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isSign = false;
  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .translucent, // Cho phép GestureDetector bắt sự kiện trên toàn bộ khu vực widget
      onTap: () {
        // Khi bên ngoài form được chạm, ẩn bàn phím bằng cách mất trọng tâm
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppBarContinerWidget(
        titleString: 'Sign Up',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kDefaultPadding * 5,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _userNameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                    prefixIcon: SizedBox(
                      width: 1,
                      child: Icon(FontAwesomeIcons.user),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  items: <String>['Vietnamese', 'Myanmar', 'japan', 'China']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.earthAsia), // Icon
                          SizedBox(width: 10), // Khoảng cách giữa icon và text
                          Text(value), // Text
                        ],
                      ),
                    );
                  }).toList(),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Phone',
                    prefixIcon: SizedBox(
                      width: 1,
                      child: Icon(FontAwesomeIcons.phone),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    prefixIcon: SizedBox(
                      width: 1,
                      child: Icon(FontAwesomeIcons.envelope),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    prefixIcon: SizedBox(
                      width: 1,
                      child: Icon(FontAwesomeIcons.lock),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'By tapping sign up you agree to the ',
                        style: TextStyle(fontSize: 14)),
                    TextSpan(
                      text: 'Terms and Conditions ', // \n để xuống dòng
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Xử lý khi người dùng nhấp vào "Terms and Conditions"
                          print('Navigate to Terms and Conditions');
                        },
                    ),
                    TextSpan(
                      text: 'and ', // \n để xuống dòng
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.5,
                        wordSpacing: 2.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Xử lý khi người dùng nhấp vào "and"
                          print('Navigate to "and"');
                        },
                    ),
                    TextSpan(
                      text: 'Privacy Policy ', // \n để xuống dòng
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Xử lý khi người dùng nhấp vào "Privacy Policy"
                          print('Navigate to Privacy Policy');
                        },
                    ),
                    TextSpan(
                      text: 'of this app',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Căn giữa dòng văn bản
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              ButtonWidget(
                title: 'Sign Up',
                isign: isSign,
                ontap: _signUp,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // Màu của đường thẳng
                      thickness: 1, // Độ dày của đường thẳng
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or sign in with',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // Màu của đường thẳng
                      thickness: 1, // Độ dày của đường thẳng
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(

                children: [
                  Expanded(child: GestureDetector(
                    // onTap: _signInWithGoogle,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageHelper.loadFromAsset(AssetHelper.icoRectangleWhite),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageHelper.loadFromAsset(AssetHelper.icoGG),
                            SizedBox(
                              width: kMinPadding,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(TicketStubScreen.routeName);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageHelper.loadFromAsset(AssetHelper.icoRectangleBlue),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageHelper.loadFromAsset(AssetHelper.icoFB),
                            SizedBox(
                              width: kMinPadding,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    // Biểu thức chính quy kiểm tra cú pháp email
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Kiểm tra email có khớp với biểu thức chính quy hay không
    return emailRegExp.hasMatch(email);
  }
  void _signUp() async{
    if(_passwordController.text.length < 6){
      showToastTop(message: 'Password must be at least 6 characters');
      return;
    }

    if(!isValidEmail(_emailController.text)){
      showToastTop(message: 'Invalid email');
      return;
    }
    setState(() {
      isSign = true;
    });
    await Future.delayed(const Duration(milliseconds: 400));
    final String userName = _userNameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String phoneNumber = _phoneNumberController.text.trim();
    print('userName: $userName, email: $email, password: $password, phoneNumber: $phoneNumber');

    User? user = await _auth.signUpWithEmailAndPassWord(email, password, userName,  phoneNumber);

    setState(() {
      isSign = false;

    });

    if(user != null){
      showToast(message: 'Sign up success');
      Navigator.of(context).pushNamed(LoginScreen.routeName);
  }else{
      showToast(message: 'Sign up failed');
    }
  }
}
