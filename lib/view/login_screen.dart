import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view/sign_up_screen.dart';
import 'package:travel_app/viewModel/user_viewmodel.dart';
import '../global/common/toast.dart';
import '../models/user_model.dart';
import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/core/helpers/image_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/buttom_widget.dart';
import '../user_auth/fiirebase_auth_immplemmentation/firebase_auth_services.dart';
import 'forgot_password_screen.dart';
import 'main_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isCheck = false;
  bool _isPressed = false;
  bool _isSigin = false;
  bool _isCliclSignUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        titleString: 'Login',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kDefaultPadding * 5,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    prefixIcon: Container(
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
                obscureText: _obscurePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    prefixIcon: Container(
                      width: 1,
                      child: Icon(FontAwesomeIcons.lock),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    )),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: _isCheck,
                          onChanged: (bool? val) {
                            setState(() {
                              _isCheck = val ?? false;
                            });
                          }),
                      // SizedBox(width: kDefaultPadding,),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: kMediumPadding,
                  ),
                  InkWell(
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                          fontSize: 14,
                          color: _isPressed ? Colors.purple : Colors.blue),
                    ),
                    onTap: () {
                      setState(() {
                        if (!_isPressed) _isPressed = true;
                        Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName);
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              //TODO login button
              ButtonWidget(
                title: 'Login',
                isign: _isSigin,
                ontap: _signIn,
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
                      'or login with',
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
                  Expanded(
                    child: GestureDetector(
                      onTap: _signInWithGoogle,
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
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
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
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: TextStyle(fontSize: 14),
                  ),
                  InkWell(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 14,
                          color: _isCliclSignUp ? Colors.purple : Colors.blue),
                    ),
                    onTap: () {
                      setState(() {
                        if (!_isCliclSignUp) _isCliclSignUp = true;
                      });
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigin = true;
    });
    await Future.delayed(const Duration(milliseconds: 400));
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    User? user = await _auth.signInWithEmailAndPassWord(email, password);
    UserModel userProvider = await _auth.getDataCurrentUser();
    Provider.of<UserViewModel>(context, listen: false).setUser(userProvider);
    setState(() {
      _isSigin = false;
    });

    if (user != null) {
      showToast(message: 'Sign in success');
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      showToast(message: 'Sign up failed');
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainApp.routeName,
              (route) => false,
        );
      }
    } catch (e) {
      showToast(message: "some error occured $e");
      print(e);
    }
  }

  _signInWithFaceBook() async {
    //TODO login with facebook
  }
}
