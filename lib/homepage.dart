import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final passwordLength = 8;
  final passwordchar =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+@^*";
  String password = "";

  void generate() {
    final random = Random.secure();
    final generated = List.generate(passwordLength,
        (index) => passwordchar[random.nextInt(passwordchar.length)]);

    setState(() {
      password = generated.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                password,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: password),
                    ).then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("password copied "),
                          backgroundColor: Colors.blue[200],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy),)
            ],
          ),),
          Center(
            child: ElevatedButton( 
              onPressed: generate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
                textStyle:const  TextStyle(fontSize: 20),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ) ,
              ),
              child: const Text("Generate the password" ),
              
            ),
          )
        ],
      ),
    );
  }
}
