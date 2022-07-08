import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shiksha_admin_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_Page extends StatefulWidget {

  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool _passwordVisible=false;
  final _auth=FirebaseAuth.instance;
  String email="";
  String password="";
  bool showspinner=false;
  static const String logo = 'assets/images/siksha_logo.svg';
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  ModalProgressHUD (
        inAsyncCall: showspinner,
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,
              ),
              Center(
                child: SvgPicture.asset(
                  logo,
                  width: 350,
                  height: 350,
                  semanticsLabel: 'Logo',
                ),
              ),
              const Center(
                child: Text("Admin Login",style: bigTextGreenHeading
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email", style: textLimeheading),
                    const SizedBox(height: 10,
                    ),
                    TextField(
                      onChanged: (value){
                        email=value;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle:const TextStyle(color: Colors.blueGrey),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        fillColor:  const Color(0xFFFFE9EF),
                        filled: true,
                      ),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 10,
                    ),
                    const Text("Password", style: textLimeheading),
                    const SizedBox(height: 10,
                    ),
                    TextField(
                      onChanged: (value){
                        password=value;
                      },
                      textAlign: TextAlign.center,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {

                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintText: 'Enter your Password',
                        hintStyle:const TextStyle(color: Colors.blueGrey),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        fillColor:  const Color(0xFFFFE9EF),
                        filled: true,
                      ),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children:  [
                        const CheckB(),
                        const Text("Remember Me"),
                        const SizedBox(width: 60,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/forgot-pass');
                          },
                          child: const Text("Forgot Password"),
                        ),
                      ],
                    ),
                    Center(
                      child:ElevatedButton(onPressed: () async{
                        setState((){
                          showspinner=true;
                        });

                        try{
                          final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user!=null){
                        Navigator.pushNamed(context, '/home');
                          }
                        }
                        catch (error) {
                          print(error);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter correct id and password"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                        setState((){
                          showspinner=false;
                        });
                      },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFFE9EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child:  Text('Login',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey,
                ),
                width: 400.0,
                height: 73.0,
                alignment: Alignment.center, // align your child's position.
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CheckB extends StatefulWidget {

  const CheckB({Key? key}) : super(key: key);

  @override
  State<CheckB> createState() => _CheckBState();
}

class _CheckBState extends State<CheckB> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.lime;
    }
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),

      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
