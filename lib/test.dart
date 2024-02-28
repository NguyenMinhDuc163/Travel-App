// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class TextFieldDemo extends StatelessWidget {
//   const TextFieldDemo({Key? key}) : super(key: key);
//   static String routeName = '/TextFieldDemo';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('TextField Demo'), // You can set your own title here
//       ),
//       body: const TextFormFieldDemo(),
//     );
//   }
// }
//
// class TextFormFieldDemo extends StatefulWidget {
//   const TextFormFieldDemo({Key? key}) : super(key: key);
//
//   @override
//   TextFormFieldDemoState createState() => TextFormFieldDemoState();
// }
//
// class PersonData {
//   String? name = '';
//   String? phoneNumber = '';
//   String? email = '';
//   String password = '';
// }
//
// class PasswordField extends StatefulWidget {
//   const PasswordField({
//     Key? key,
//     this.restorationId,
//     this.fieldKey,
//     this.hintText,
//     this.labelText,
//     this.helperText,
//     this.onSaved,
//     this.validator,
//     this.onFieldSubmitted,
//     this.focusNode,
//     this.textInputAction,
//   }) : super(key: key);
//
//   final String? restorationId;
//   final Key? fieldKey;
//   final String? hintText;
//   final String? labelText;
//   final String? helperText;
//   final FormFieldSetter<String>? onSaved;
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onFieldSubmitted;
//   final FocusNode? focusNode;
//   final TextInputAction? textInputAction;
//
//   @override
//   State<PasswordField> createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   late bool _obscureText;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: widget.fieldKey,
//       restorationId: 'password_text_field',
//       obscureText: _obscureText,
//       maxLength: 8,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       decoration: InputDecoration(
//         filled: true,
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         helperText: widget.helperText,
//         suffixIcon: IconButton(
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           hoverColor: Colors.transparent,
//           icon: Icon(
//             _obscureText ? Icons.visibility : Icons.visibility_off,
//             semanticLabel: _obscureText ? 'Show Password' : 'Hide Password',
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class TextFormFieldDemoState extends State<TextFormFieldDemo> {
//   PersonData person = PersonData();
//
//   late FocusNode _phoneNumber, _email, _lifeStory, _password, _retypePassword;
//
//   @override
//   void initState() {
//     super.initState();
//     _phoneNumber = FocusNode();
//     _email = FocusNode();
//     _lifeStory = FocusNode();
//     _password = FocusNode();
//     _retypePassword = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     _phoneNumber.dispose();
//     _email.dispose();
//     _lifeStory.dispose();
//     _password.dispose();
//     _retypePassword.dispose();
//     super.dispose();
//   }
//
//   void showInSnackBar(String value) {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(value),
//     ));
//   }
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final GlobalKey<FormFieldState<String>> _passwordFieldKey =
//   GlobalKey<FormFieldState<String>>();
//   final _UsNumberTextInputFormatter _phoneNumberFormatter =
//   _UsNumberTextInputFormatter();
//
//   void _handleSubmitted() {
//     final form = _formKey.currentState!;
//     if (!form.validate()) {
//       showInSnackBar('Please fix the errors in the form.');
//     } else {
//       form.save();
//       showInSnackBar('Name: ${person.name}, Phone: ${person.phoneNumber}');
//     }
//   }
//
//   String? _validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Name is required';
//     }
//     final nameExp = RegExp(r'^[A-Za-z ]+$');
//     if (!nameExp.hasMatch(value)) {
//       return 'Please enter only alphabetical characters';
//     }
//     return null;
//   }
//
//   String? _validatePhoneNumber(String? value) {
//     final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
//     if (!phoneExp.hasMatch(value!)) {
//       return 'Please enter a valid US phone number';
//     }
//     return null;
//   }
//
//   String? _validatePassword(String? value) {
//     final passwordField = _passwordFieldKey.currentState!;
//     if (passwordField.value == null || passwordField.value!.isEmpty) {
//       return 'Please enter a password';
//     }
//     if (passwordField.value != value) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const sizedBoxSpace = SizedBox(height: 24);
//
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             sizedBoxSpace,
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               textCapitalization: TextCapitalization.words,
//               decoration: InputDecoration(
//                 filled: true,
//                 icon: const Icon(Icons.person),
//                 hintText: 'What do people call you?',
//                 labelText: 'Name *',
//               ),
//               onSaved: (value) {
//                 person.name = value;
//                 _phoneNumber.requestFocus();
//               },
//               validator: _validateName,
//             ),
//             sizedBoxSpace,
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               focusNode: _phoneNumber,
//               decoration: InputDecoration(
//                 filled: true,
//                 icon: const Icon(Icons.phone),
//                 hintText: 'Where can we reach you?',
//                 labelText: 'Phone Number *',
//                 prefixText: '+1 ',
//               ),
//               keyboardType: TextInputType.phone,
//               onSaved: (value) {
//                 person.phoneNumber = value;
//                 _email.requestFocus();
//               },
//               maxLength: 14,
//               maxLengthEnforcement: MaxLengthEnforcement.none,
//               validator: _validatePhoneNumber,
//               // TextInputFormatters are applied in sequence.
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly,
//                 // Fit the validating format.
//                 _phoneNumberFormatter,
//               ],
//             ),
//             sizedBoxSpace,
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               focusNode: _email,
//               decoration: InputDecoration(
//                 filled: true,
//                 icon: const Icon(Icons.email),
//                 hintText: 'Your email address',
//                 labelText: 'Email',
//               ),
//               keyboardType: TextInputType.emailAddress,
//               onSaved: (value) {
//                 person.email = value;
//                 _lifeStory.requestFocus();
//               },
//             ),
//             sizedBoxSpace,
//             TextFormField(
//               focusNode: _lifeStory,
//               decoration: InputDecoration(
//                 border: const OutlineInputBorder(),
//                 hintText: 'Tell us about yourself',
//                 helperText: 'Keep it short, this is just a demo.',
//                 labelText: 'Life Story',
//               ),
//               maxLines: 3,
//             ),
//             sizedBoxSpace,
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               focusNode: _password,
//               decoration: InputDecoration(
//                 filled: true,
//                 labelText: 'Password *',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       // _obscureText = !_obscureText;
//                     });
//                   },
//                   icon: Icon(
//                     // _obscureText ? Icons.visibility : Icons.visibility_off,
//                       Icons.visibility
//                   ),
//                 ),
//               ),
//               maxLength: 8,
//               // obscureText: _obscureText,
//               validator: _validatePassword,
//               onFieldSubmitted: (value) {
//                 _handleSubmitted();
//               },
//             ),
//             sizedBoxSpace,
//             TextFormField(
//               focusNode: _retypePassword,
//               decoration: InputDecoration(
//                 filled: true,
//                 labelText: 'Retype Password *',
//               ),
//               maxLength: 8,
//               obscureText: true,
//               validator: _validatePassword,
//               onFieldSubmitted: (value) {
//                 _handleSubmitted();
//               },
//             ),
//             sizedBoxSpace,
//             Center(
//               child: ElevatedButton(
//                 onPressed: _handleSubmitted,
//                 child: Text('Submit'),
//               ),
//             ),
//             sizedBoxSpace,
//             Text(
//               '* Required fields',
//               style: Theme.of(context).textTheme.caption,
//             ),
//             sizedBoxSpace,
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// Format incoming numeric text to fit the format of (###) ###-#### ##
// class _UsNumberTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue,
//       TextEditingValue newValue,
//       ) {
//     final newTextLength = newValue.text.length;
//     final newText = StringBuffer();
//     var selectionIndex = newValue.selection.end;
//     var usedSubstringIndex = 0;
//     if (newTextLength >= 1) {
//       newText.write('(');
//       if (newValue.selection.end >= 1) selectionIndex++;
//     }
//     if (newTextLength >= 4) {
//       newText.write('${newValue.text.substring(0, usedSubstringIndex = 3)}) ');
//       if (newValue.selection.end >= 3) selectionIndex += 2;
//     }
//     if (newTextLength >= 7) {
//       newText.write('${newValue.text.substring(3, usedSubstringIndex = 6)}-');
//       if (newValue.selection.end >= 6) selectionIndex++;
//     }
//     if (newTextLength >= 11) {
//       newText.write('${newValue.text.substring(6, usedSubstringIndex = 10)} ');
//       if (newValue.selection.end >= 10) selectionIndex++;
//     }
//     // Dump the rest.
//     if (newTextLength >= usedSubstringIndex) {
//       newText.write(newValue.text.substring(usedSubstringIndex));
//     }
//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }
