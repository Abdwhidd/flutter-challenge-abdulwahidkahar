import 'package:alert/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/theme.dart';
import 'package:flutter_challenge/widgets/myform_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
      print('Validate');
    }else{
      print('Not Validate');
    }
  }

  String? validatepass(value) {
    if(value!.isEmpty) {
      return "Anda belum mengisi password";
    }else {
      return null;
    };
  }

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/header-login.png',
                      width: 127,
                    ),
                    SizedBox(width: 22,),
                    Image.asset('assets/images/logo.png',
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',
                        style: blackTextStyle.copyWith(
                          fontSize: 28,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('Please sign in to continue',
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),

                // MY FORM
                SizedBox(height: 30,),
                Container(
                  width: 348,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40),
                    child: Center(
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                hintText: 'Your Email',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: purpleColor,
                                  ),
                                ),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: 'Anda belum mengisi ID'),
                                  EmailValidator(errorText: 'ID yang Anda masukkan tidak valid'),
                                ]
                              ),
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              obscureText: isHiddenPassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                suffixIcon: InkWell(
                                  onTap: _tombolshowhide,
                                  child: Icon(Icons.visibility,
                                    color: greyColor,
                                  ),
                                ),
                                hintText: 'Your Password',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                    color: purpleColor,
                                  ),
                                ),
                              ),
                              validator: validatepass,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40,),
                // BUTTON LOGIN
                Center(
                  child: Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Login Berhasil',
                                  style: greyTextStyle.copyWith(
                                    color: blackColor,
                                  ),
                                ),
                                content: Text('Anda sudah mengisi Email dan Password'),
                                actions: [
                                  FlatButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Error',
                                        style: greyTextStyle.copyWith(
                                          color: purpleColor,
                                          fontWeight: medium,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Oke',
                                      style: greyTextStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 16,
                                        color: purpleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text('LOGIN',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ),

                // NEW ACCOUNT
                SizedBox(height: 120,),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have an account?',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: redTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _tombolshowhide() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

}


