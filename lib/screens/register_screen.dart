import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressingController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

//name validation
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }


//address validation
  String? _validateAddressing(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }


// Contact number validation
  String? _validateContactNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact Number is required';
    }
    final contactNumberRegex = RegExp(r'^[0-9]{10}$');
    if (!contactNumberRegex.hasMatch(value)) {
      return 'Please enter a valid contact number';
    }
    return null;
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
 
 // Confirm password validation
  String? _validateConfirmPassword(String? value) {
    if (_passwordController.text == '' || _confirmPasswordController.text == '') {
      return 'Confirm Password is required';
    }
    if (_passwordController.text!= _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }




  void _handleRegistration() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      Navigator.pushNamed(context, '/login');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color.fromARGB(255, 3, 80, 143),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/re.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                 key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Create an account so you can explore all the existing jobs",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                 
                    const SizedBox(height: 35),

                    //name Field
                    TextFormField(
                      controller: _nameController,
                      validator: _validateName,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
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
                        prefixIcon: Icon(Icons.person,
                            color: Colors.white), 
                        hintStyle:
                            TextStyle(color: Colors.white70), 
                      ),
                    ),

                     const SizedBox(height: 15,),

                     //address
                     TextFormField(
                      controller: _addressingController,
                      validator: _validateAddressing,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Address',
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
                        prefixIcon: Icon(Icons.location_city,
                            color: Colors.white), 
                        hintStyle:
                            TextStyle(color: Colors.white70), 
                      ),
                    ),

                  
                   const SizedBox(height: 15,),

                   //contact number
                   TextFormField(
                    controller: _contactNumberController,
                    validator: _validateContactNumber,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'Contact Number',
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
                        prefixIcon: Icon(Icons.phone,
                            color: Colors.white), 
                        hintStyle:
                            TextStyle(color: Colors.white70), 
                      ),
                   ),

                  const  SizedBox(height: 15,),

                    //email Field
                    TextFormField(
                     controller: _emailController,
                     validator: _validateEmail,
                     style: const TextStyle(color: Colors.white),
                     decoration: const InputDecoration(
                       labelText: 'Email',
                       labelStyle: TextStyle(color: Colors.white), 
                       border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
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
                       hintStyle: TextStyle(color: Colors.white70), 
                     ),
                   ),


                   const SizedBox(height: 15,),

                   //password Field
                   TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    validator: _validatePassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white), 
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
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

                   const SizedBox(height: 15,),

                   //confirm password Field
                    TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    validator: _validateConfirmPassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: ' Confirm Password',
                        labelStyle: const TextStyle(color: Colors.white), 
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
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
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white, 
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                        hintStyle: const TextStyle(
                            color: Colors.white70), 
                      ),
                      
                   ),

                        const SizedBox(height: 20),

                        //register button
                         SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleRegistration,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 80, 143),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    //login link
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    


                  

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
