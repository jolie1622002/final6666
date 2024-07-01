import 'package:flutter/material.dart';

class EscortInfo extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool isMale;
  final bool isFemale;

  const EscortInfo({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.isMale,
    required this.isFemale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escort Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Name: $firstName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Last Name: $lastName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Phone Number: $phone',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Gender: ${isMale ? 'Male' : isFemale ? 'Female' : 'Not specified'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
