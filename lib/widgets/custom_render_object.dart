import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderObject extends SingleChildRenderObjectWidget {
  const CustomRenderObject({super.key, Widget? child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDecoratedBox(
        child: RenderProxyBox(),
        decoration: const BoxDecoration(
          color: Colors.black38,
          boxShadow: [
            BoxShadow(color: Colors.yellow),
            BoxShadow(
              color: Colors.red,
              spreadRadius: -12.0,
              blurRadius: 12.0,
            ),
          ],
        ));
  }
}
