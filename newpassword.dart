import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/loginscreen.dart';
import 'package:login_app/screens/success.dart';
import 'package:login_app/validation.dart';
import 'package:http/http.dart' as http;

import '../models/newpasswordModal.dart';
import '../models/verifyotpmodal.dart';



class NewPassword extends StatefulWidget {
  @override
  State<NewPassword> createState() => _NewPasswordState();
}
bool _isHidden = false;
bool _isvisible = false;




class _NewPasswordState extends State<NewPassword> {

  void dispose() {
    super.dispose();
    TextEditingController().dispose();
  }

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  final String? userId = verify.userId;

  final GlobalKey<FormState> formkey2 = GlobalKey<FormState>();

  Future<NewPasswordModal?> newpassword() async {
    try {
      String apiUrl = "https://lgswazirabad.track4sol.com/API/change_password.php";

      final response = await http.post(Uri.parse(apiUrl), body: {
        'password' : newPasswordController.text,
         'id' : userId,
      });

      newPasswordmodal = NewPasswordModal.fromJson(json.decode(response.body));
      print(response.body);
      print(userId);
      return newPasswordmodal;
    }

    catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
               SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: const Text(
                              "Reset Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: formkey2,
                            child: Column(
                              children: [
                                Container(
                                  width: 260,
                                  height: 60,
                                  child: TextFormField(
                                    controller: newPasswordController,
                                    validator: (value){
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      if(value.isValidPassword){
                                        return null;
                                      }
                                      else 'Please enter password containing special chracters and numbers';
                                    },
                                    onChanged: (value) {},
                                    obscureText: !_isHidden,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 10),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isHidden
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        },
                                      ),

                                      hintText: 'New Password',
                                      hintStyle: TextStyle(color: Colors.grey,
                                          fontSize: 10),
                                      //labelText: "Password",
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: secondaryColor, width: 1.5),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: 260,
                                  height: 60,
                                  child: TextFormField(
                                    controller: confirmNewPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter confirm password';
                                      }

                                      if(newPasswordController.text != confirmNewPasswordController.text){
                                        return 'Password do not matched';
                                      }
                                      else 'Password matched' ;

                                    },
                                    onChanged: (value) {},
                                    obscureText: !_isvisible,
                                    keyboardType: TextInputType.visiblePassword,
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 10),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isvisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isvisible = !_isvisible;
                                          });
                                        },
                                      ),
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(color: Colors.grey,
                                          fontSize: 10),
                                      //labelText: "Password",
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: secondaryColor, width: 1.5),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    try{
                                      newpassword().then((value) {
                                        if (value?.status == "200" && formkey2.currentState!.validate() ) {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessScreen()));
                                        }
                                        else{
                                          print('Good!');
                                        }

                                      });
                                    }
                                    catch(e){
                                      print(e);
                                    }
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
                                        'Reset',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
//if(newPasswordController == passwordController){
//                                          final snackBar = SnackBar( content: Text('Password is same from the previous',
//                                            style: ksnack,),);
//                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                                        }