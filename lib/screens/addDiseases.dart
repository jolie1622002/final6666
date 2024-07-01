import 'package:flutter/material.dart';
import '../components/button_com.dart';
import '../components/textField_com.dart';
import 'Api/api_manager.dart';

class AddDiseases extends StatefulWidget {
  @override
  State<AddDiseases> createState() => _AddDiseasesState();
}

class _AddDiseasesState extends State<AddDiseases> {
  TextEditingController nameDiseaseController = TextEditingController();
  TextEditingController descriptionDiseaseController = TextEditingController();
  TextEditingController commonSymptomsController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Add Diseases.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 130),
                TextFieldComponent(
                  controlleR: nameDiseaseController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Disease Name';
                    }
                    return null;
                  },
                  labelText: 'Disease Name',
                  inputType: TextInputType.name,
                  preIcon: Icons.verified,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: descriptionDiseaseController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Disease Description';
                    }
                    return null;
                  },
                  labelText: 'Disease Description',
                  inputType: TextInputType.name,
                  preIcon: Icons.description,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  controlleR: commonSymptomsController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Common Symptoms';
                    }
                    return null;
                  },
                  labelText: 'Common Symptoms',
                  inputType: TextInputType.name,
                  preIcon: Icons.description,
                ),
                const SizedBox(height: 10),
                ButtonComponent(
                      () {
                    addDisease();
                    print('Attempting to add disease...');
                  },
                  buttonName: 'Add',
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addDisease() {
    if (formKey.currentState?.validate() == true) {
      print('Form validated, sending request...');
      Api_manager.registerDisease(
        nameDiseaseController.text,
        descriptionDiseaseController.text,
        commonSymptomsController.text,
        context,
      ).then((response) {
        if (response != null) {
          print('Disease added successfully: ${response.toJson()}');
        } else {
          print('Failed to add disease.');
        }
      }).catchError((error) {
        print('Error adding disease: $error');
      });
    }
  }
}
