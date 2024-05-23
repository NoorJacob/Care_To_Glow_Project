import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glow_guide_project/Screens/first_customization_screen.dart';
import 'package:glow_guide_project/Screens/page1.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _pressedeye = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 110, 40, 20),
          child: Text(
            "Create an account!",
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(230, 156, 95, 85),
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  label: Text("User Name",
                      style: TextStyle(color: Colors.black54)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(230, 156, 95, 85), width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(230, 156, 95, 85)))),
              controller: nameController,
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  label: Text("Email", style: TextStyle(color: Colors.black54)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(230, 156, 95, 85), width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(230, 156, 95, 85)))),
              controller: emailController,
            )),
        // Padding(
        //     padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
        //     child: TextFormField(
        //       validator: (phone) {
        //         if (phone == null || phone.isEmpty) {
        //           return "Phone number is required";
        //         }
        //         if (phone.length != 10) {
        //           return "Phone number must be 10 digits";
        //         }
        //         if (!phone.startsWith("079") &&
        //             !phone.startsWith("078") &&
        //             !phone.startsWith("077")) {
        //           return "Wrong phone number";
        //         }
        //         return null;
        //       },
        //       decoration: const InputDecoration(
        //           suffixIcon: Icon(Icons.phone),
        //           label: Text("Phone",
        //               style: TextStyle(color: Colors.black54)),
        //           enabledBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                   color: Color.fromARGB(230, 156, 95, 85),
        //                   width: 2)),
        //           focusedBorder: OutlineInputBorder(
        //               borderSide: BorderSide(
        //                   color: Color.fromARGB(230, 156, 95, 85)))),
        //       controller: phoneController,
        //     )),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
          child: TextFormField(
            obscureText: _pressedeye,
            decoration: InputDecoration(
                label: const Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(230, 156, 95, 85), width: 2)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _pressedeye = !_pressedeye;
                      });
                    },
                    icon: _pressedeye == false
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(230, 156, 95, 85)))),
            controller: passwordController,
          ),

          //   _buildButton("Sign Up"),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(60, 70, 60, 10),
            child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (credential != null) {
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(credential.user!.uid)
                            .set({"user name": nameController});

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => FirstCustom()));
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("The password provided is too weak."),
                          duration: Duration(milliseconds: 3000),
                        ));
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "The account already exists for that email."),
                          duration: Duration(milliseconds: 3000),
                        ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: const TextStyle(
                        color: Color.fromARGB(230, 156, 95, 85), fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                )))
      ]),
    );
  }
}
