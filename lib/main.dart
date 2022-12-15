import 'package:advanced_widgets/inherited_widget_example.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_render_object.dart';
import 'widgets/weather_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isDark = false;
  @override
  Widget build(BuildContext context) {
    return InheritedWidgetExample(
      isDark: isDark,
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: InheritedWidgetExample.of(context).isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          home: MyHomePage(
              title: 'Flutter Demo Home Page',
              callback: () {
                setState(() {
                  isDark = !isDark;
                });
              }),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final VoidCallback? callback;

  const MyHomePage({
    super.key,
    required this.title,
    this.callback,
  });

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
            Switch(
                value: InheritedWidgetExample.of(context).isDark,
                onChanged: (_) {
                  widget.callback?.call();
                }),
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
