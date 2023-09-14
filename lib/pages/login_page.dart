import 'package:flutter/material.dart';
import 'package:mobile_app_collab/components/my_button.dart';
import 'package:mobile_app_collab/components/my_textfield.dart';
import 'package:mobile_app_collab/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

              // logo
              Image.asset('lib/images/lebron.jpg', height: 100),

              const SizedBox(height: 25),

              //welcome back, you've been missed
              Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              //forgot password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 25),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // google + apple sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(width: 25),

                  //apple button
                  SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),

              const SizedBox(height: 25),

              //register now if not a member
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Register now',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        )));
  }
}