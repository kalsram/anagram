import 'package:flutter/material.dart';

class Anagram extends StatefulWidget {
  @override
  _AnagramCheckerState createState() => _AnagramCheckerState();
}

class _AnagramCheckerState extends State<Anagram> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  String result = '';

  void checkAnagram() {
    String word1 = textEditingController1.text;
    String word2 = textEditingController2.text;

    word1 = word1.replaceAll(' ', '').toLowerCase();
    word2 = word2.replaceAll(' ', '').toLowerCase();

    if (word1.length != word2.length) {
      setState(() {
        result = 'Not anagrams';
      });
      return;
    }

    List<String> list1 = word1.split('')..sort();
    List<String> list2 = word2.split('')..sort();

    for (int i = 0; i < word1.length; i++) {
      if (list1[i] != list2[i]) {
        setState(() {
          result = 'Not anagrams';
        });
        return;
      }
    }

    setState(() {
      result = 'Anagrams';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anagram Checker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController1,
              decoration: InputDecoration(labelText: 'Enter String 1'),
            ),
            TextField(
              controller: textEditingController2,
              decoration: InputDecoration(labelText: 'Enter String2'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                checkAnagram();
              },
              child: Text('Check Anagram'),
            ),
            SizedBox(height: 20.0),
            Text(result),
          ],
        ),
      ),
    );
  }
}
