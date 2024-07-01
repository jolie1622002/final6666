import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';
import 'package:flutter_application_1/screens/Register/infoP.dart';

import 'Api/api_manager.dart';
import 'Register/PatientInfo.dart';
import 'addDiseases.dart';
import 'addEcortInfo_screen.dart';
import 'addHistory.dart';
import 'package:flutter_application_1/Success.dart';

class AddPatientInfo extends StatefulWidget {
  static const String routeName = 'Paitent';
  @override
  State<AddPatientInfo> createState() => _AddPatientInfoState();
}

class _AddPatientInfoState extends State<AddPatientInfo> {
  //const AddEscortInfo({super.key});
  TextEditingController FirstController = TextEditingController();
  TextEditingController LastController = TextEditingController();
  // TextEditingController IdPatientController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  // TextEditingController passwardController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController HandelController = TextEditingController();
  // TextEditingController ImageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassward = true;
  var isMale = false;
  var isFemale = false;
  Image? imgEscort;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/add patient.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                  onTap: (() {}),
                  child: CircleAvatar(
                    radius: 25,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: FirstController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid First Name';
                  }
                  return null;
                },
                labelText: 'First Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldComponent(
                controlleR: LastController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your User Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Last Name';
                  }
                  return null;
                },
                labelText: 'Last Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextFieldComponent(
              //   controlleR: IdPatientController,
              //   validate: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter your ID ';
              //     }
              //     bool emailValid = RegExp(
              //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //         .hasMatch(value);
              //     if (!emailValid) {
              //       'Enter Valid ID';
              //     }
              //     return null;
              //   },
              //   labelText: 'PatientID',
              //   inputType: TextInputType.name,
              //   preIcon: Icons.person,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              const SizedBox(
                height: 20,
              ),
              TextFieldComponent(
                controlleR: EmailController,
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
                labelText: 'Email',
                inputType: TextInputType.emailAddress,
                preIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFieldComponent(
              //   controlleR: passwardController,
              //   validate: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter your Passward';
              //     } else if (value.length < 8) {
              //       return 'The Password Should be at least 8 Letters';
              //     }
              //     return null;
              //   },
              //   isPassward: isPassward,
              //   labelText: 'Passward',
              //   inputType: TextInputType.visiblePassword,
              //   preIcon: Icons.lock,
              //   sufIcon: isPassward ? Icons.visibility_off : Icons.visibility,
              //   sufIconPressed: () {
              //     setState(() {
              //       isPassward = !isPassward;
              //     });
              //   },
              // ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: PhoneController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Phone';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Phone';
                  }
                  return null;
                },
                labelText: 'PhoneNumber',
                inputType: TextInputType.phone,
                preIcon: Icons.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldComponent(
                controlleR: HandelController,
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
                labelText: 'Handel',
                inputType: TextInputType.name,
                preIcon: Icons.task,
              ),
              CheckboxListTile(
                title: Text('Male'),
                value: isMale,
                onChanged: (newbool) {
                  setState(() {
                    isMale = newbool!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Female'),
                value: isFemale,
                onChanged: (newbool1) {
                  setState(() {
                    isFemale = newbool1!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonComponent(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddDiseases();
                      })));
                    },
                    buttonWidth: 165,
                    buttonName: 'Add Diseases',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonComponent(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddEscortInfo();
                      })));
                    },
                    buttonWidth: 165,
                    buttonName: 'Add Escort',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonComponent(
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return AddHistoryScreen();
                      })));
                    },
                    buttonWidth: 165,
                    buttonName: 'Add History',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonComponent(
                    () {
                      addPatient();
                    },
                    buttonWidth: 165,
                    buttonName: 'Add',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);},
                  child: Text('Back'))
            ]),
          ),
        ),
      ),
    );
  }

  void addPatient() {
    if (formKey.currentState?.validate() == true) {
      Api_manager.registerPatient(
        FirstController.text,
        LastController.text,
        EmailController.text,
        PhoneController.text,
        HandelController.text,
        isMale,
        isFemale,
        context,
      );

      // Navigate directly to PatientDetailsScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PatientDetailsScreen(
            firstName: FirstController.text,
            lastName: LastController.text,
            email: EmailController.text,
            phone: PhoneController.text,
            handle: HandelController.text,
            isMale: isMale,
            isFemale: isFemale,
          ),
        ),
      );
    }
  }

  // Navigate to success page after registering patient


}
