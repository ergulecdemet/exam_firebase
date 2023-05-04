import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.amber,
                  hintText: "E posta",
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.amber,
                  hintText: "Şifre",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());

                    print("buttona basıldı");
                  },
                  child: Text("Giriş Yap")),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    print("kayıt - buttona basıldı");
                  },
                  child: Text("Kayıt ol")),
            ],
          ),
        ),
      ),
    );
  }
}
