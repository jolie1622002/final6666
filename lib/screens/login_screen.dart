import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import 'package:flutter_application_1/screens/add_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const LoginScreen({Key key}) : super(key: key);
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwardController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassward = true;
  var isPatient = false;
  var isEscort = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(children: [
                Container(
                  padding: EdgeInsets.only(top: 160, bottom: 50),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      '        Wellcome to ZEE\n Please Login to continue ',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                TextFieldComponent(
                  controlleR: userNameController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your user name correctly';
                    }
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      'Enter Valid User Name';
                    }
                    return null;
                  },
                  labelText: 'User Name',
                  inputType: TextInputType.name,
                  preIcon: Icons.verified,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldComponent(
                  controlleR: passwardController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your passward correctly';
                    } else if (value.length < 8) {
                      return 'The Password Should be at least 8 Letters';
                    }
                    return null;
                  },
                  isPassward: isPassward,
                  labelText: 'Passward',
                  inputType: TextInputType.visiblePassword,
                  preIcon: Icons.lock,
                  sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
                  sufIconPressed: () {
                    setState(() {
                      isPassward = !isPassward;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                  title: Text('Patient'),
                  value: isPatient,
                  onChanged: (newbool) {
                    setState(() {
                      if (isEscort == true) {
                        isEscort = false;
                        isPatient = newbool!;
                      } else {
                        isPatient = newbool!;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Escort'),
                  value: isEscort,
                  onChanged: (newbool1) {
                    setState(() {
                      if (isPatient == true) {
                        isPatient = false;
                        isEscort = newbool1!;
                      } else {
                        isEscort = newbool1!;
                      }
                    });
                  },
                ),
                ButtonComponent(
                  () {
                    if (formKey.currentState!.validate()) {
                      print('Login success');
                      print(userNameController.text);
                      print(passwardController.text);
                    }
                    if (isEscort == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddScreen();
                      })));
                    } else if (isPatient == true) {
                    } else {
                      print('error when login');
                    }
                  },
                  buttonName: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Does not have account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterScreen');
                        print('Ls');
                      },
                      child: const Text(
                        ' Register Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ButtonComponent(
                      () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                            return AddScreen();
                          })));
                  },
                  buttonName: 'Login',
                ),

              ]),
            ),
          ),
        ),
      ),
    );
  }
}
