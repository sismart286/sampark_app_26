import 'package:flutter/material.dart';
import 'package:sampark_app_26/Widgets/PrimaryButton.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Column(
      children: [
        SizedBox(height: 40),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.alternate_email_rounded),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password_outlined),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              ontap: () {},
              btnName: "SIGNUP",
              icon: Icons.lock_open_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
