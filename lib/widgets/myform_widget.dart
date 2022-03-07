import 'package:flutter/material.dart';

import '../theme.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
      print('Validate');
    }else{
      print('Not Validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 40),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelText: 'User ID',
                  ),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Anda belum mengisi Password";
                    }else {
                      return null;
                    };
                  },
                ),

                SizedBox(height: 40,),
                // BUTTON LOGIN
                Center(
                  child: Container(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        validate;
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* TextFormField(
            cursorColor: purpleColor,
            decoration: InputDecoration(
              hintText: 'Your Password',
              hintStyle: greyTextStyle.copyWith(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: purpleColor,
                ),
              ),
            ),
          ),

 */
