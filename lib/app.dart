import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intern_test/core.dart';
import 'package:intern_test/widgets/TextInputField.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController controllerInput1 = TextEditingController();
  TextEditingController controllerInput2 = TextEditingController();
  Core coreCaculate = Core();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cộng Hai Số"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //input 1
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 20,
                child: TextInputField(
                  controller: controllerInput1,
                  labelText: 'First Number',
                  icon: Icons.edit,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //plus icon
              Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //input 2
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 20,
                child: TextInputField(
                  controller: controllerInput2,
                  labelText: 'Second Number',
                  icon: Icons.edit,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //equal Button
              TextButton(
                onPressed: () {
                  print("click");
                  if (controllerInput1.text.isNotEmpty &&
                      controllerInput2.text.isNotEmpty) {
                    if (coreCaculate.isNumber(controllerInput1.text) &&
                        coreCaculate.isNumber(controllerInput2.text)) {
                      coreCaculate.sum(
                          controllerInput1.text, controllerInput2.text);
                    } else {
                      print("loi");
                    }
                  } else {
                    result = "Input was empty";
                  }

                  //if 2 input is number
                  //   setState(() {
                  //     result = (coreCaculate.convertStringToNumber(
                  //                 controllerInput1.text) +
                  //             coreCaculate
                  //                 .convertStringToNumber(controllerInput2.text))
                  //         .toString();
                  //   });
                  // } else {
                  //   setState(() {
                  //     result = "Invalid input. Please check again";
                  //   });
                  // }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                          blurRadius: 5),
                    ],
                  ),
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  child: const Center(
                    child: Text(
                      "=",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
