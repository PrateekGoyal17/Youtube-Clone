import 'package:flutter/material.dart';
import 'pages/dashboard.dart';

void main() => runApp(
      MaterialApp(
        home: Dashboard(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
