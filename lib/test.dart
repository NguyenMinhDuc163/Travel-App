// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Text with Centered Lines Example'),
//         ),
//         body: Center(
//           child: MyText(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         style: TextStyle(color: Colors.black, fontSize: 16),
//         children: [
//           TextSpan(
//             text: 'By tapping sign up you agree to the ',
//           ),
//           TextSpan(
//             text: 'Terms and Conditions\n', // \n để xuống dòng
//             style: TextStyle(
//               color: Colors.blue,
//               decoration: TextDecoration.underline,
//               fontWeight: FontWeight.bold,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 // Xử lý khi người dùng nhấp vào "Terms and Conditions"
//                 print('Navigate to Terms and Conditions');
//               },
//           ),
//           TextSpan(
//             text: 'and\n', // \n để xuống dòng
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//               fontWeight: FontWeight.normal,
//               fontStyle: FontStyle.italic,
//               letterSpacing: 1.5,
//               wordSpacing: 2.0,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 // Xử lý khi người dùng nhấp vào "and"
//                 print('Navigate to "and"');
//               },
//           ),
//           TextSpan(
//             text: 'Privacy Policy\n', // \n để xuống dòng
//             style: TextStyle(
//               color: Colors.blue,
//               decoration: TextDecoration.underline,
//               fontWeight: FontWeight.bold,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 // Xử lý khi người dùng nhấp vào "Privacy Policy"
//                 print('Navigate to Privacy Policy');
//               },
//           ),
//           TextSpan(
//             text: 'of this app',
//           ),
//         ],
//       ),
//       textAlign: TextAlign.center, // Căn giữa dòng văn bản
//     );
//   }
// }
