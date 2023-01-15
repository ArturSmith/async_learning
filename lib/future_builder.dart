import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FutureBuilderExample> {
  final Future _calculation = Future.delayed(const Duration(seconds: 3));
  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            double size = 200;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                size = 100;
                break;
              case ConnectionState.waiting:
                size = 150;
                break;
              case ConnectionState.active:
                size = 200;

                break;
              case ConnectionState.done:
                size = 250;
                break;
            }

            return Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                color: Colors.red,
                height: size,
                width: size,
                child: Center(
                  child: Text("$size"),
                ),
              ),
            );
          }),
    );
  }
}
