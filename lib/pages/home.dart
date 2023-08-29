import 'package:flutter/material.dart';
import 'package:youtube_clone/services/api_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

ApiClient apiClient = ApiClient();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(apiClient.getVideos());
    return Scaffold();
  }
}