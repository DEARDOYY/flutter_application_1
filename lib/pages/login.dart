library login;

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    // Implement your login logic here, e.g., Firebase or REST API
    try {
      // Example: Firebase Auth (if using Firebase)
      // UserCredential userCredential = await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);

      // For demo
      await Future.delayed(const Duration(seconds: 2));
      // print('Logged in as $email');
    } catch (e) {
      print('Login failed: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        automaticallyImplyLeading: false,
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: _formKey,
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              // ]),
            ),
            MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                // Validate and save the form values
                _formKey.currentState?.saveAndValidate();
                debugPrint(_formKey.currentState?.value.toString());

                // On another side, can access all field values without saving form with instantValues
                _formKey.currentState?.validate();
                debugPrint(_formKey.currentState?.instantValue.toString());
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Login'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: FormBuilder(
  //         key: _formKey,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             FormBuilderTextField(
  //               name: "email",
  //               decoration: const InputDecoration(labelText: 'Email'),
  //             ),
  //             TextField(
  //               controller: _passwordController,
  //               decoration: const InputDecoration(labelText: 'Password'),
  //               obscureText: true,
  //             ),
  //             const SizedBox(height: 20),
  //             _isLoading
  //                 ? const CircularProgressIndicator()
  //                 : ElevatedButton(
  //                     onPressed: _login,
  //                     child: const Text('Login'),
  //                   ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
