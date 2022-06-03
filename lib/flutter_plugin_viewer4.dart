
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FlutterPluginViewer4 extends StatefulWidget {
  const FlutterPluginViewer4({Key? key}) : super(key: key);

  @override
  State<FlutterPluginViewer4> createState() => _MyAppState();
}

class _MyAppState extends State<FlutterPluginViewer4> {
  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}