import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/uniqlo.dart';
import 'package:flutter_application_1/uniqlo_detail.dart';

void main() {
  runApp(const UniqloApp());
}

class UniqloApp extends StatelessWidget {
  const UniqloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Uniqlo Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    print(Uniqlo.samples[index].imgLabel);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return UniqloDetail(uniqlo: Uniqlo.samples[index]);
                      }),
                    );
                  },
                  child: bulidUniqloCard(Uniqlo.samples[index]));
            },
            itemCount: Uniqlo.samples.length,
          ),
        ),
      ),
    );
  }
}

Widget bulidUniqloCard(Uniqlo uniqlo) {
  return Card(
      elevation: 2.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(uniqlo.imgLabel,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14.0),
            Image(image: AssetImage(uniqlo.imageUrl)),
            const Text("Now Uniqlo Shop have promotions! Check it out!"),
          ],
        ),
      ));
}