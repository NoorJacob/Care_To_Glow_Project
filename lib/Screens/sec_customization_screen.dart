import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glow_guide_project/Screens/page1.dart';

class SecondCustom extends StatefulWidget {
  const SecondCustom({super.key});

  @override
  State<SecondCustom> createState() => _SecondCustomState();
}

class _SecondCustomState extends State<SecondCustom> {
  bool Pimples = false;
  bool Large_pores = false;
  bool dryness = false;
  bool Pigmentation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 170, 30, 20),
            child: new Text(
              "Which of these problems do you have with your skin?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(230, 156, 95, 85),
              ),
            ),
          ),
           CheckboxListTile(
                 checkColor: Colors.brown,
                 title: Text("Pimples", style:TextStyle(color:Colors.brown) ),
                  activeColor: Colors.brown,
                  value: Pimples,
                  onChanged: (selectedPimples) {
                    setState(() {
                      Pimples = selectedPimples!;
                    });
                  }),


          CheckboxListTile( checkColor: Colors.brown,
              title: Text("Large pores", style:TextStyle(color:Colors.brown)),
              activeColor: Colors.brown,
              value: Large_pores,
              onChanged: (selectedLargePores) {
                setState(() {
                  Large_pores = selectedLargePores!;
                });
              }),
          CheckboxListTile(checkColor: Colors.brown,
              title: Text("Dryness", style:TextStyle(color:Colors.brown)),
              activeColor: Colors.brown,
              value: dryness,
              onChanged: (selectedDryness) {
                dryness = selectedDryness!;
              }),
          CheckboxListTile(checkColor: Colors.brown,
              title: Text("Pigmentation", style:TextStyle(color:Colors.brown)),
              activeColor: Colors.brown,
              value: Pigmentation,
              onChanged: (selectedPigmentation) {
                setState(() {
                  Pigmentation = selectedPigmentation!;
                });
              }
              ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 80, 60, 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1()));
              },
              child: Text(
                "Get My Customized Routine!",
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
