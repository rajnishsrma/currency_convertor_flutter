import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMainPage extends StatefulWidget {
  const CurrencyConverterMainPage({super.key});

  @override
  State<CurrencyConverterMainPage> createState() =>
      _CurrencyConverterMainPageState();
}

class _CurrencyConverterMainPageState extends State<CurrencyConverterMainPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 81;
    });
  }

  @override
  void initState() {
    //it will executed right before the build method
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(20),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text(
          "currecy converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 25)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  // label: Text("enter amount in INR"),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "amount",
                  prefixIcon: Icon(Icons.monetization_on),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //without focused
                  enabledBorder: borderStyle,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // if (kDebugMode) {
                //   print(textEditingController);
                // }
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.amber),
                elevation: WidgetStatePropertyAll(15),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10),
                      right: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              child: const Text("click me"),
            ),
          ],
        ),
      ),
    );
  }
}
