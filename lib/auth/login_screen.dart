import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/auth/fire_auth.dart';
import 'package:movie_stream/auth/validator.dart';
import 'package:movie_stream/screens/bottomNavyScreen.dart';
import 'package:movie_stream/widgets/logo_auth.dart';

import '../style_constants.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleAuth;

  LoginScreen({required this.toggleAuth});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color _colorText = Colors.black54;
  bool _isHidden = true;
  final _loginFormKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();


  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPassword = FocusNode();
  FocusNode _focusSubmit = FocusNode();

  //Check if the user is signed in
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavy(user: user)));
    }
    return firebaseApp;
  }

  void togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusEmail = FocusNode();
    _focusPassword = FocusNode();
    _focusSubmit = FocusNode();
    setState(() {
    });
  }

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    _focusSubmit.dispose();
    super.dispose();
  }

  void _submitLoginForm() async {
    if (_loginFormKey.currentState!.validate()) {
      User? user = await FireAuth.signInUsingEmailPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text,
          context: context);
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => BottomNavy(user: user),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
/*   const _focusColor = Color(0xFFBD4B4B);
   const _defaultColor = Colors.black54;*/
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
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
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
                            key: _loginFormKey,
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      controller: _emailTextController,
                                      focusNode: _focusEmail,
                                      autofocus: true,
                                      validator: (value) =>
                                          Validator.validateEmail(
                                              email: _emailTextController.text,
                                          ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20.0),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(color: _colorText),
                                        prefixIcon: Icon(Icons.lock,  color: _focusEmail.hasFocus ? Colors.red : Colors.grey),
                                        filled: true,
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                          ),
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
                                      textInputAction: TextInputAction.done,
                                      controller: _passwordTextController,
                                      focusNode: _focusPassword,
                                      validator: (value) =>
                                          Validator.validatePassword(
                                              password:
                                                  _passwordTextController.text,
                                          ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(20.0),
                                        hintText: 'Password',
                                        prefixIcon: Icon(Icons.lock,  color: _focusPassword.hasFocus ? Color(0xFFBD4B4B) : Colors.grey),
                                        suffixIcon: InkWell(
                                          child: Icon(
                                            _isHidden
                                                ? Icons.visibility_off
                                                : Icons.visibility, color: _focusPassword.hasFocus ? Color(0xFFBD4B4B) : Colors.grey
                                          ),
                                          onTap: togglePassword,
                                        ),
                                        filled: true,
                                        enabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ),
                                      onFieldSubmitted: (term) {
                                        _focusPassword.unfocus();
                                        FocusScope.of(context).requestFocus(_focusSubmit);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        child: Text('Forgot your password?'),
                                        onTap: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      child: ElevatedButton(
                                        focusNode: _focusSubmit,
                                        onPressed: () => _submitLoginForm,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0,
                                          ),
                                          child: Text(
                                            'Login',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Don\'t have an account?'),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            widget.toggleAuth();
                                          },
                                          child: Text(
                                            'Register',
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
