import 'package:flutter/material.dart';
import 'package:money_app/constant/colors.dart';
import 'package:money_app/constant/kpadding.dart';
import 'package:money_app/screens/user_service.dart';
import 'package:money_app/widget/custom_btn.dart';

import 'main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter Your \nPersonal Details",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                      },
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter valid email";
                        }
                      },
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        prefixIcon: Icon(Icons.alternate_email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter valid password less than 8 character";
                        }
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        prefixIcon: Icon(Icons.password_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please confirm your password";
                        }
                      },
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        prefixIcon: Icon(
                          Icons.confirmation_num_outlined,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 230,
                        ),
                        const Text("Remember Me"),
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: kMainColor,
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          String confirmPassword =
                              _confirmPasswordController.text;

                          if (password != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password doesn't match"),
                              ),
                            );
                            return;
                          }
                          await UserServices.storeUserData(
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                            context: context,
                          );
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MainScreen();
                                },
                              ),
                            );
                          }
                        }
                      },
                      child: const CustomBtn(
                        btnColor: kMainColor,
                        btnText: "Register",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
