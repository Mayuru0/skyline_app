// login_screen.dart
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation
  String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
       if (value.length < 8) {
        return 'Password must be at least 8 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
       return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
      }
     if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
            Navigator.pushNamed(context, '/');
        },
    ),
    title: const Text('Login Page',
    style: TextStyle(color: Colors.white),
    ),
    backgroundColor: const Color.fromARGB(255, 3, 80, 143),
),
      body: Stack(
        children: [
          // Background Image Layer with Opacity
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 22, 22, 22).withOpacity(0.4),
              ),
            ],
          ),
          // Content Layer
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                        child: Image.asset(
                      "assets/new logo.png",
                      height: 200,
                      width: 200,
                    )),
                  ),
                  const Text(
                    "Welcome !",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Email Field
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      controller: _emailController,
                      validator: _validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.white), 
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Colors.white), 
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white), 
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), 
                        ),
                        prefixIcon: Icon(Icons.email,
                            color: Colors.white), 
                        hintStyle:
                            TextStyle(color: Colors.white70), 
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Password Field
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: _validatePassword,
                      obscureText: !_isPasswordVisible,
                      style: const TextStyle(
                          color: Colors.white), 
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Colors.white), 
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white), 
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .white),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), 
                        ),
                        prefixIcon: const Icon(Icons.lock,
                            color: Colors.white), 
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white, // Visibility toggle icon color
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.white70), 
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Forgot Password Button
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Aligns content to the left
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password logic here
                            // Navigator.pushNamed(context, '/forgot_password'); // Temporary for navigation
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline, 
                              decorationColor: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Login Button
                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 50),
                    ),
                    child: const Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Create new account
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
