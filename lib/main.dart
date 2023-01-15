import 'package:flutter/material.dart';
import 'package:flutter_practice8/future_builder.dart';
import 'package:flutter_practice8/stream_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: 
      // StreamBuilderExample(),
      FutureBuilderExample(),
    );
  }
}

