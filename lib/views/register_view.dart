import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegiseterView extends StatefulWidget {
  const RegiseterView({super.key});

  @override
  State<RegiseterView> createState() => _RegiseterViewState();
}

class _RegiseterViewState extends State<RegiseterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), // Your image path here
              fit: BoxFit.cover, // Covers the entire container
            ),
          ),
          // margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Signup',
                style: TextStyle(
                  color: Color.fromRGBO(229, 229, 229, 1),
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(229, 229, 229, 1)),
                  ),
                ],
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(229, 229, 229, 1),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0))),
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(229, 229, 229, 1)),
                  ),
                ],
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(229, 229, 229, 1),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter your password',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: const Color.fromRGBO(45, 196, 215, 0.7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // Set rounded corner radius here
                    )), // fromHeight use double.infinity as width and 40 is the height

                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredantil = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('weak password');
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Register'),
                ),
              ),
              const SizedBox(height: 50.0),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login/', (route) => false);
                  },
                  child: const Text(
                    'Already Registred ? Login Here',
                    style: TextStyle(
                      color: Colors.white, // Set the text color here
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
