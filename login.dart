import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpageui/singup.dart';

import 'anmition/fadeanimation.dart';



enum Gender {
  Email,
  password,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white70;
  Color deaible = Colors.white;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  Gender? selected;
  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: const Color(0xFF1F1A30),
            body: SingleChildScrollView(
              child: Expanded(
                flex: 1,
                child: SizedBox(
                  width: we,
                  height: he,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        delay: 0.8,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png",
                          width: we * 0.9,
                          height: he * 0.4,
                        ),
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 230.0),
                          child: Text(
                            "Login",
                            style: GoogleFonts.heebo(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 150.0),
                          child: Text(
                            "Please sign in to continue",
                            style: GoogleFonts.heebo(
                                color: Colors.grey, letterSpacing: 0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: he * 0.04,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: we * 0.9,
                          height: he * 0.071,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: selected == Gender.Email
                                ? enabled
                                : backgroundColor,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter your Email");
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("please enter a valid email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: selected == Gender.Email
                                    ? enabledtxt
                                    : deaible,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: selected == Gender.Email
                                    ? enabledtxt
                                    : deaible,
                              ),
                            ),
                            style: TextStyle(
                                color: selected == Gender.Email
                                    ? enabledtxt
                                    : deaible,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: he * 0.02,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: we * 0.9,
                          height: he * 0.071,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: selected == Gender.password
                                  ? enabled
                                  : backgroundColor),
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Password is required for login");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Please enter valid password of minimum 6 character");
                              }
                            },
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock_open_outlined,
                                  color: selected == Gender.password
                                      ? enabledtxt
                                      : deaible,
                                ),
                                suffixIcon: IconButton(
                                  icon: ispasswordev
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: selected == Gender.password
                                              ? enabledtxt
                                              : deaible,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: selected == Gender.password
                                              ? enabledtxt
                                              : deaible,
                                        ),
                                  onPressed: () => setState(
                                      () => ispasswordev = !ispasswordev),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: selected == Gender.password
                                        ? enabledtxt
                                        : deaible)),
                            style: TextStyle(
                              color: selected == Gender.password
                                  ? enabledtxt
                                  : deaible,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: he * 0.02,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: TextButton(
                            onPressed: () {
                             if(_key.currentState!.validate()){
	login(context);
}

                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.heebo(
                                color: Colors.black,
                                letterSpacing: 0.5,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF0DF5E4),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      SizedBox(height: he * 0.12),
                      FadeAnimation(
                        delay: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: GoogleFonts.heebo(
                                  color: Colors.grey,
                                  letterSpacing: 0.5,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const Singup();
                                }));
                              },
                              child: Text("Sign up",
                                  style: GoogleFonts.heebo(
                                    color: const Color(0xFF0DF5E4)
                                        .withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  void login(BuildContext context)  {
	var alertDialog=AlertDialog(
	title:Text("login successfull",style:TextStyle(
	fontSize:20,
	color:Color.black87,
	backgroundColor:Colors.white24,
),
),
);
   showDialog(
context:context,
builder:(BuildContext context){
return alertDialog;
}
);
  }
}
