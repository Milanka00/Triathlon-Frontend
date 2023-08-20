import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/signup.dart';
import 'package:triathlon/utils/custom_colors.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            const Text(
              'Forget Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Form(

              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      prefixIcon: const Icon(Icons.email,
                        color: Color.fromARGB(255, 0, 0, 0),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black,),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style:  ButtonStyle(

                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: mediaQuery.width * .15,
                                vertical: mediaQuery.height * .022)),

                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}