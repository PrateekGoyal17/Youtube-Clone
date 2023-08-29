import 'package:flutter/material.dart';
import 'package:youtube_clone/pages/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppBar _buildAppbar() {
    return AppBar(
      titleSpacing: 15,
      elevation: 0,
      actions: const [
        Icon(Icons.cast),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.notifications_none_sharp),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.search),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.account_circle_sharp),
        SizedBox(
          width: 20,
        ),
      ],
      title: SizedBox(
          height: 23,
          child: Image.network(
              "https://freelogopng.com/images/all_img/1656504144youtube-logo-png-white.png")),
    );
  }

  List<BottomNavigationBarItem> _items() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.tap_and_play), label: "Shorts"),
      BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: "Subscriptions"),
      BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Library"),
    ];
  }

  List<Widget> _screens() {
    return [
      Home(),
      Text("Shorts"),
      Text("Add"),
      Text("Subs"),
      Text("Library"),
    ];
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _screens()[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          onTap: (int currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
          currentIndex: index,
          fixedColor: Colors.white,
          showUnselectedLabels: true,
          items: _items()),
    );
  }
}
