import 'package:flutter/material.dart';
import 'package:glow_guide_project/Screens/sign_up_screen.dart';

import 'log_in_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      body: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 120, 100, 15),
              child: Image.asset(
                "lib/Assets/Images/logo.png",
                width: 200,
                height: 200,
              ),
            )
          ]),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(77, 5, 77, 130),
                child: Text(
                  "FOR GLOWING, HYDRATED SKIN!",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(230, 156, 95, 85),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 10),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push( MaterialPageRoute(
                          builder: (context) => SignUp(),)
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: const TextStyle(
                            color: Color.fromARGB(230, 156, 95, 85)),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )))
          ]),
          Row(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 70, 10),
                child: SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push( MaterialPageRoute(
                          builder: (context) => LogIn(),)
                        );
                      },
                      child: Text(
                        "Log In",
                        style: const TextStyle(
                            color: Color.fromARGB(230, 156, 95, 85)),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )))
          ])
        ],
      ),
    );
  }
}
