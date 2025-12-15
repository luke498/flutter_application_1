import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/uniqlo.dart';
import 'package:flutter_application_1/main.dart';

class UniqloDetail extends StatelessWidget {
  Uniqlo uniqlo;

  UniqloDetail({super.key, required this.uniqlo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Uniqlo Detail'),
        ),
        body: Center(
          // child: Text(uniqlo.imgLabel),
          child: Column(
            children: <Widget>[
              Text(uniqlo.imgLabel,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold)),
              Image(image: AssetImage(uniqlo.imageUrl)),
              const SizedBox(height: 8),
              Text(
                uniqlo.description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ));
  }
}