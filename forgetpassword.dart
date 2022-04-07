import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/otpscreen.dart';
import 'package:login_app/validation.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/otpModal.dart';



class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

final TextEditingController emailController = TextEditingController();

class _ForgotPasswordState extends State<ForgotPassword> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<OtpModal?> getOtp() async {
    try {
      String apiUrl = "https://lgswazirabad.track4sol.com/API/otp.php";
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': emailController.text,
      });

      otpmodal = OtpModal.fromJson(json.decode(response.body));
      EasyLoading.dismiss();
      print(response.body);
      return otpmodal;
    }

    catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 60,
                    width: 180,
                    //child: LottieBuilder.asset("assets/lottie/login2.json"),
                    child: Image(image: AssetImage('assets/images/finallogo.png'),)
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    //width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Forgot Password?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: const Text(
                              "We just need your registered email address!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: formkey,
                            child: Container(
                              width: 260,
                              height: 60,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  if (value.isValidEmail) {
                                    return null;
                                  } else
                                    return 'Please enter valid email';
                                },
                                onSaved: (_email){
                                  _email = emailController.text;
                                  print(_email);
                                },
                                onChanged: (value) {},
                                style: TextStyle(color: Colors.black,
                                    fontSize: 10),
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(color: Colors.grey,
                                      fontSize: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: secondaryColor, width: 1.5),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () async {

                                getOtp().then((value) {
                                  if (value?.message == 'Please check your email for OTP code and enter here to reset password.' &&  formkey.currentState!.validate()) {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp()));
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppView()));

                                    final snackBar = SnackBar( content: Text('Please check your email for OTP code', style:ksnack,));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  else

                                    //Email Does Not Exist
                                  {
                                    final snackBar = SnackBar( content: Text('Email Does Not Exist',
                                      style:ksnack,
                                    ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                });
                              },
                              child: Container(
                              alignment: Alignment.center,
                              width: 260,
                              height: 40,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        bgColor,
                                        secondaryColor,
                                      ])),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Send',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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

            ],
          ),
        ),
      ),
    );
  }
}
//loginmodel.seekerDetails?.email
