import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderObject extends SingleChildRenderObjectWidget {
  const CustomRenderObject({super.key})
      : super(child: const SizedBox.square(dimension: 100.0));

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
