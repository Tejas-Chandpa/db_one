
import 'package:flutter/material.dart';
import 'package:db_one/screens/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

// void doUserResetPassword() async {
//   var controlleremail;
//   final ParseUser user = ParseUser(null, null, controlleremail.text.trim());
//   final ParseResponse parseResponse = await user.requestPasswordReset();
//   if (parseResponse.success) {
//     Message.showSuccess(
//         context: context,
//         message: 'Password reset instructions have been sent to email!',
//         onPressed: () {
//           Navigator.of(context).pop();
//         });
//   } else {
//     Message.showError(context: context, message: parseResponse.error!.message);
//   }
// }
//
// class Message {
//   static void showSuccess({context, required String message, required Null Function() onPressed}) {}
//
//   static void showError({required JsObject context, message}) {}
// }
//
// class ParseResponse {
//   bool? get success => null;
//
//   get error => null;
// }
//
// class ParseUser {
//   ParseUser(param0, param1, trim);
//
//   requestPasswordReset() {}
// }
