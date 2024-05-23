import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glow_guide_project/Screens/page1.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _pressedeye = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      appBar: AppBar(
        title: const Text(
          "Log In Page",
          style:
              TextStyle(color: Color.fromARGB(230, 156, 95, 85), fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(90, 100, 90, 2),
            child: Text(
              "Welcome!",
              style: TextStyle(
                  fontSize: 45,
                  color: Color.fromARGB(230, 156, 95, 85),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 50),
            child: Text(
              "Log into your account to continue.",
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(230, 156, 95, 85)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  label: Text("Email", style: TextStyle(color: Colors.black54)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(230, 156, 95, 85), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(230, 156, 95, 85)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 3),
            child: TextField(
              controller: passwordController,
              obscureText: _pressedeye,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _pressedeye = !_pressedeye;
                        });
                      },
                      icon: _pressedeye == false
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.visibility_off)),
                  label: Text(
                    "Password",
                    style: TextStyle(color: Colors.black54),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(230, 156, 95, 85), width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(230, 156, 95, 85)))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(70, 70, 70, 10),
              child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {

                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text
                        );

                        if(credential != null)
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Page1()));

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("No user found for that email."),
                            duration: Duration(milliseconds: 3000),
                          ));

                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Wrong password provided for that user."),
                            duration: Duration(milliseconds: 3000),
                          ));
                        }
                      }

                    },
                    child: Text(
                      "Log In",
                      style: const TextStyle(
                          color: Color.fromARGB(230, 156, 95, 85),
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )
              )
          )
        ],
      ),
    );
  }
}

// TextFormField(
//   decoration: const InputDecoration(
//       label: Text("Email"),
//       enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2))),
// ),
// TextFormField(
//   decoration: const InputDecoration(
//       label: Text("Password"),
//       enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2)),
//       suffixIcon: IconButton(
//           onPressed: (){}, icon: Icon(Icons.remove_red_eye)
//       )
//   ),
// ),
