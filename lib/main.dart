import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/uniqlo.dart';
import 'package:flutter_application_1/uniqlo_detail.dart';

void main() {
  runApp(const UniqloApp());
}

class UniqloApp extends StatelessWidget {
  const UniqloApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Uniqlo Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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