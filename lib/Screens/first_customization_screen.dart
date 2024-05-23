import 'package:flutter/material.dart';
import 'package:glow_guide_project/Screens/sec_customization_screen.dart';

class FirstCustom extends StatefulWidget {
  const FirstCustom({super.key});

  @override
  State<FirstCustom> createState() => _FirstCustomState();
}

class _FirstCustomState extends State<FirstCustom> {
  String selectedSkinType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 200, 70, 20),
            child: new Text(
              "What's your skin type?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(230, 156, 95, 85),
              ),
            ),
          ),
          RadioListTile(
              activeColor: Colors.brown,
              title: Text(
                "Dry Skin",
                style: TextStyle(
                  color: Color.fromARGB(230, 156, 95, 85),
                ),
              ),
              value: "dry",
              groupValue: selectedSkinType,
              onChanged: (skinType) {
                setState(() {
                  selectedSkinType = skinType.toString();
                });
              }),
          RadioListTile(
              activeColor: Colors.brown,
              title: Text("Sensitive Skin",
                  style: TextStyle(
                    color: Color.fromARGB(230, 156, 95, 85),
                  )),
              value: "sensitive",
              groupValue: selectedSkinType,
              onChanged: (skinType) {
                setState(() {
                  selectedSkinType = skinType.toString();
                });
              }),
          RadioListTile(
              activeColor: Colors.brown,
              title: Text("Combination Skin",
                  style: TextStyle(
                    color: Color.fromARGB(230, 156, 95, 85),
                  )),
              value: "combination",
              groupValue: selectedSkinType,
              onChanged: (skinType) {
                setState(() {
                  selectedSkinType = skinType.toString();
                });
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 80, 100, 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondCustom()));
              },
              child: Text(
                "Next",
                style: const TextStyle(
                    color: Color.fromARGB(230, 156, 95, 85), fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ),
    );
  }
}
