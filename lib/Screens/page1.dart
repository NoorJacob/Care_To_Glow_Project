import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 200, 186, 190),
      appBar: AppBar(title: Text("Care To Glow"),centerTitle: true,),
      drawer: Drawer(child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 50, 18, 10),
          child: Image.asset("lib/Assets/Images/logo.png", width: 150,height: 150,),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(77, 0, 77, 130),
          child: Text(
            "Care To Glow",
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(230, 156, 95, 85),
            fontWeight: FontWeight.bold),
          ),
        )
      ],),),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(child: Image.asset("lib/Assets/Images/1.jpg",width: 250, height: 250,),padding: EdgeInsets.fromLTRB(100, 20, 100, 0),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        "5X PURE HYALURONIC CREAM Moisturizing and plumping facial cream formulated to help smooth wrinkles and deeply hydrate the skin. A unique formula with 5 types of Hyaluronic Acid of different molecular weight (high, medium and low), Ceramides, Squalane, Soft-Focus Pearls and Anti-Pollution Shield. The perfect union of the 5 Hyaluronic Acids allows for greater effectiveness thanks to the fact that they fill in wrinkles and provide greater hydration in each of the layers of the epidermis, from the inside to the outside. Skin looks and feels softer, more hydrated, juicier and younger.", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          )
          ,Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(child: Image.asset("lib/Assets/Images/2.jpg",width: 250, height: 250,),padding: EdgeInsets.fromLTRB(100, 20, 100, 0),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "VIT-C SERUM Concentrated Altamonte serum with antioxidant action for brighter, hydrated and younger skin. What makes it special? ✓A unique formula with Vitamin C, Proteoglycans and Glycopolymers. ✓Its great antioxidant, anti-aging and energizing power makes facial skin feel brighter, vital and softer from the first application. ✓Pleasant fluid texture that is quickly absorbed.", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(child: Image.asset("lib/Assets/Images/3.jpg",width: 250, height: 250,),padding: EdgeInsets.fromLTRB(100, 20, 100, 0),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "5X PURE HYALURONIC CREAM Moisturizing and plumping facial cream formulated to help smooth wrinkles and deeply hydrate the skin. A unique formula with 5 types of Hyaluronic Acid of different molecular weight (high, medium and low), Ceramides, Squalane, Soft-Focus Pearls and Anti-Pollution Shield. The perfect union of the 5 Hyaluronic Acids allows for greater effectiveness thanks to the fact that they fill in wrinkles and provide greater hydration in each of the layers of the epidermis, from the inside to the outside. Skin looks and feels softer, more hydrated, juicier and younger.", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(child: Image.asset("lib/Assets/Images/4.jpg",width: 250, height: 250,),padding: EdgeInsets.fromLTRB(100, 20, 100, 0),),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "5X PURE HYALURONIC AMPOULES Highly concentrated ampoules with 5 types of Hyaluronic Acid that deeply hydrate the skin and fill in wrinkles. What makes them special ✓ A unique formula with 5 types of Hyaluronic Acid of different molecular weight (high, medium and low) and Ceramides. ✓ The perfect union of the 5 Hyaluronic Acids allows for greater effectiveness thanks to the fact that they fill in wrinkles and provide greater hydration in each of the layers of the epidermis, from the inside to the outside. Skin looks and feels softer, more hydrated, juicier and younger. ✓ Velvety, fast-absorbing texture.", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
