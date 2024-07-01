import 'package:flutter/material.dart';

class PatientDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace these placeholders with actual patient information
    String firstName = 'John';
    String lastName = 'Doe';
    String email = 'john.doe@example.com';
    String phoneNumber = '+1 123-456-7890';
    String handle = 'johndoe123';

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('First Name: $firstName'),
            Text('Last Name: $lastName'),
            Text('Email: $email'),
            Text('Phone Number: $phoneNumber'),
            Text('Handle: $handle'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
