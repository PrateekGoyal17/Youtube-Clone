import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(snapshot.data[index]['snippet']
                            ['thumbnails']['high']['url']),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png"),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: Text(
                              snapshot.data[index]['snippet']['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ],
                        ),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left:50.0),
                            child: Text(Numeral(int.parse(snapshot.data[index]['statistics']["viewCount"])).format()),
                          ),
                        ],),
                      ],
                    ),
                  );
                });
          }
        });
  }
}
