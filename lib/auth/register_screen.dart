import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/reusable_btn.dart';
import '../style_constants.dart';

class RegisterScreen extends StatefulWidget {
 final Function toggleAuth;
 RegisterScreen({required this.toggleAuth});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.mail),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
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
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ReusableButton(btnText: 'Register', btnColor: 0xFFBD4B4B, btnTextColor: 0xffEEEEEE, function: (){}),
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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'MoveiizPLAY',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
      );
  }
}
