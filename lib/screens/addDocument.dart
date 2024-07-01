import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';

class AddDocument extends StatefulWidget {
  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  //const AddEscortInfo({super.key});
  TextEditingController NameDrugController = TextEditingController();
  TextEditingController IdPatientController = TextEditingController();
  TextEditingController IdPrescriptionController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController IdDiseaseController = TextEditingController();
  TextEditingController IdEscortController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Add Document.png'),
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
                height: 130,
              ),
              TextFieldComponent(
                controlleR: NameDrugController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Name Drug';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Name Drug';
                  }
                  return null;
                },
                labelText: 'Drug Name',
                inputType: TextInputType.name,
                preIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdPatientController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Patient';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Patient';
                  }
                  return null;
                },
                labelText: 'Patient ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdPrescriptionController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Prescription';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Prescription';
                  }
                  return null;
                },
                labelText: 'Prescription ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: DescriptionController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Description';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Description';
                  }
                  return null;
                },
                labelText: 'Description',
                inputType: TextInputType.name,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Exrays tests:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 85,
                  ),
                  ButtonComponent(
                    () {},
                    buttonName: 'Choose file',
                    buttonWidth: 110,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdDiseaseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Disease';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Disease';
                  }
                  return null;
                },
                labelText: 'Disease ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: IdEscortController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Id Escort';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Escort';
                  }
                  return null;
                },
                labelText: 'Escort ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  if (formKey.currentState!.validate()) {
                    print('Go to next step success');
                    print(NameDrugController.text);
                    print(IdPatientController.text);
                    print(IdPrescriptionController.text);
                    print(DescriptionController.text);
                    print(IdDiseaseController.text);
                    print(IdEscortController.text);
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: ((context) {
                    // return AddScreen();
                    // })));
                  }
                },
                buttonName: 'Add',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ]),
          ),
        ),
      ),
    );
  }
}
