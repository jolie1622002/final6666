// import 'package:flutter/cupertino.dart';
// import 'package:flutter_application_1/Dialog.dart';
// import 'package:flutter_application_1/screens/Api/api_manager.dart';
//
// import 'Register_Response.dart';
//
// class Auth_register extends StatelessWidget
// {
//
//   String name;
//   String emaill;
//   String Password;
//   String RePassword;
//   String PhoneNumber;
//   Auth_register({required this.name,required this.emaill,required this.Password,required this.RePassword,required this.PhoneNumber});
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<RegisterResponse?>(
//         future: Api_manager.register(name, emaill, Password, RePassword, PhoneNumber),
//         builder: (context,snapshot){
//           if(snapshot.connectionState==ConnectionState.waiting)
//             {
//               DialogUtils.showLoading(context, "Loding...");
//             }
//           else if(snapshot.hasError)
//             {
//                DialogUtils.showMessage(context,message: "Some thing went wrong");
//             }
//           else
//             {
//               DialogUtils.closeLoading(context);
//               DialogUtils.showMessage(context,title: 'sucsess', message: 'Register success',posActionName: 'ok');
//             }
//
//           return Text('Error');
//     });
//   }
//
// }