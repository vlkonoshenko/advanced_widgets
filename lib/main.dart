import 'package:flutter/material.dart';

import 'widgets/custom_render_object.dart';
import 'widgets/weather_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool isLarge = false;
  double weather = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomRenderObject(),
            Slider(
                value: weather,
                onChanged: (value) {
                  setState(() {
                    weather = value;
                  });
                }),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: isLarge ? 200 : 100,
              height: isLarge ? 200 : 100,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isLarge = !isLarge;
                  });
                },
                child: CustomPaint(
                  painter: WeatherIcon(weather),
                  size: const Size(double.infinity, double.infinity),
                ),
              ),
            ),
            if (isLarge)
              const Text(
                'You have pushed the button this many times:',
              ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
