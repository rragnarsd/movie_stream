import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/auth/fire_auth.dart';
import 'package:movie_stream/auth/validator.dart';
import 'package:movie_stream/screens/bottomNavyScreen.dart';
import 'package:movie_stream/widgets/logo_auth.dart';

import '../style_constants.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleAuth;
  RegisterScreen({required this.toggleAuth});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isHidden = true;
  final _registerFormKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();

  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPassword = FocusNode();
  FocusNode _focusName = FocusNode();
  FocusNode _focusSubmit = FocusNode();

  void togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _submitRegisterForm() async {
    if (_registerFormKey.currentState!.validate()) {
      User? user = await FireAuth.registerUsingEmailPassword(
          name: _nameTextController.text,
          email: _emailTextController.text,
          password: _passwordTextController.text);
      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavy(user: user)));
      }
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text('Successfully registered ${user!.email}'),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    _focusEmail = FocusNode();
    _focusPassword = FocusNode();
    _focusName = FocusNode();
    _focusSubmit = FocusNode();
  }

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    _focusName.dispose();
    _focusSubmit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          image: NetworkImage(
              'https://images.unsplash.com/photo-1485700330317-57a99a571ecb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1275&q=80'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: Form(
                      key: _registerFormKey,
                      child: Container(
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: _emailTextController,
                                focusNode: _focusEmail,
                                validator: (value) => Validator.validateEmail(
                                    email: _emailTextController.text),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.mail),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                onFieldSubmitted: (term) {
                                  _focusEmail.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_focusPassword);
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                obscureText: _isHidden,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                controller: _passwordTextController,
                                focusNode: _focusPassword,
                                validator: (value) =>
                                    Validator.validatePassword(
                                        password: _passwordTextController.text),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                    child: Icon(_isHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    ),
                                    onTap: togglePassword,
                                  ),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (term) {
                                  _focusPassword.unfocus();
                                  FocusScope.of(context).requestFocus(_focusName);
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _nameTextController,
                                textInputAction: TextInputAction.done,
                                focusNode: _focusName,
                                validator: (value) => Validator.validateName(
                                    name: _nameTextController.text),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: 'Full Name',
                                  prefixIcon: Icon(Icons.person),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                ),
                                onFieldSubmitted: (term) {
                                  _focusName.unfocus();
                                  FocusScope.of(context).requestFocus(_focusSubmit);
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50.0,
                                child: ElevatedButton(
                                  focusNode: _focusSubmit,
                                  onPressed: () => _submitRegisterForm,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                    ),
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: kTextStyleMedium.copyWith(
                                          fontSize: 18.0,
                                          color: Color(0xffEEEEEE)),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    elevation: 5.0,
                                    primary: Color(0xFFBD4B4B),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have a account?'),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      widget.toggleAuth();
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LogoAuth(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
