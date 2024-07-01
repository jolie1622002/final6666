import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import 'package:flutter_application_1/screens/Api/api_manager.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const RegisterScreen({ Key key }) : super(key: key);
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userpasswardController = TextEditingController();
  TextEditingController userrepeatPasswardController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var isPassward = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/signup.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 125,
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldComponent(
                controlleR: userNameController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
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
                controlleR: userEmailController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Email';
                  }
                  return null;
                },
                labelText: 'Email ',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: userpasswardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Passward';
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
              TextFieldComponent(
                controlleR: userrepeatPasswardController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please repeat your Passward correctly';
                  } else if (value != userpasswardController.text) {
                    return 'The Password doesn\'t match';
                  } else if (value.length < 8) {
                    return 'The Password Should be at least 8 Letters';
                  }
                  return null;
                },
                isPassward: isPassward,
                labelText: 'Repeat Passward',
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
              TextFieldComponent(
                controlleR: userPhoneController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid  phone';
                  }
                  return null;
                },
                labelText: ' Phone',
                inputType: TextInputType.phone,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  register();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) {
                  //   return LoginScreen();
                  // })));
                },
                buttonName: 'Register',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('already have an account?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      print('Rs');
                    },
                    child: const Text(
                      ' Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      Api_manager.register(
          userNameController.text,
          userEmailController.text,
          userpasswardController.text,
          userrepeatPasswardController.text,
          userPhoneController.text,
          context);
    }
  }
}
