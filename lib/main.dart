import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('DİCEE'),
          backgroundColor: Colors.blue,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  // stateless olunca değişemeyen arayüz yapmak gibi. fakat statefull olunca fonk falan ekleyip değişebilir yapıda oluyor.
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // değişebilir yapıda yazdık

  var leftDiceNumber;
  var rightDiceNumber;

  void changeDiceFace(){

    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;// 0-5 yerine 1-6 olması için kullandık.
      rightDiceNumber = Random().nextInt(6)+1;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            // genelde row ya da column ile beraber kullanılan bir yerlesim widgeti
            child: ElevatedButton(
              onPressed: () {
                changeDiceFace();
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                onPressed: () {
                 changeDiceFace();

                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}
