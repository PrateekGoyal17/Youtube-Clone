import 'package:flutter/material.dart';
import 'package:youtube_clone/services/api_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiClient.getVideos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Some error Occured!!"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
              return Container(
                child: Image.network(snapshot.data[index]['snippet']
                    ['thumbnails']['high']['url']),
              );
            });
          }
        });
  }
}
