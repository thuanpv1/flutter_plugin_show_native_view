
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FlutterPluginViewer4 extends StatefulWidget {
  const FlutterPluginViewer4({Key? key}) : super(key: key);

  @override
  State<FlutterPluginViewer4> createState() => _MyAppState();
}

class _MyAppState extends State<FlutterPluginViewer4> {
  String _platformVersion = 'Unknown';
  static const MethodChannel _channel = MethodChannel('flutter_plugin_viewer4');

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _channel.invokeMethod('getPlatformVersion') ?? 'unknown';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return ListView(
      children: [
        Text(_platformVersion),
        Container(
          height: 200,
          child: AndroidView(
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
          ),
        ),
      ],
    );
  }
}