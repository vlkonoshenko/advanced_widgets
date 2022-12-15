import 'package:flutter/material.dart';

import 'widgets/custom_render_object.dart';
import 'widgets/weather_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomRenderObject(
              child: Text(
                '123',
                style: TextStyle(fontSize: 50),
              ),
            ),
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
    );
  }
}
