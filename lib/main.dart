import 'package:flutter/material.dart';
import 'package:materi_http/future-builder-http-all.dart';
import 'package:materi_http/http-delete.dart';
import 'package:materi_http/http-get.dart';
import 'package:materi_http/http-model.dart';
import 'package:materi_http/http-post.dart';
import 'package:materi_http/http-patch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpModel(),
    );
  }
}
