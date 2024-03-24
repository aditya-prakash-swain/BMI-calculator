import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI calculator',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();

  var result = "";
  var bgcolor = Colors.amber.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle( fontWeight: FontWeight.bold, color: Colors.black),

        ),
        backgroundColor: Colors.yellow,
        shadowColor: Colors.black,
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.symmetric(),
            ),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in KG'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter Text in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inch = inchcontroller.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iin = int.parse(inch);
                        var tInch = (12 * ift) + iin;

                        var tCm = tInch * 2.54;
                        var tm = tCm / 100;
                        var bmi = iwt / (tm * tm);

                        var msg;
                        if (bmi < 18) {
                          msg = "you are under weight";
                          bgcolor = Colors.blue.shade200;
                        } else if (bmi > 25) {
                          msg = "you are overweight";
                          bgcolor = Colors.orange.shade300;
                        } else {
                          msg = "you are healthy";
                          bgcolor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = "please fill all the required blanks!!";
                        });
                      }
                    },
                    child: Text('Calculate')),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
