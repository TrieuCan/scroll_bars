import 'package:flutter/material.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  ScrollBottomNavigationBarController _scrollBottomNavigationBarController;

  @override
  void initState() {
    super.initState();
    _scrollBottomNavigationBarController = ScrollBottomNavigationBarController()
      ..pages.listen(onTap);
  }

  @override
  void dispose() {
    _scrollBottomNavigationBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ScrollBody(
          scrollBottomNavigationBarController:
              _scrollBottomNavigationBarController,
          builder: (context, index) => Container(
            height: MediaQuery.of(context).size.height +
                (kBottomNavigationBarHeight * 2),
            child: Center(
              child: Text("Pinned $index"),
            ),
          ),
        ),
        bottomNavigationBar: ScrollBottomNavigationBar(
          scrollBottomNavigationBarController:
              _scrollBottomNavigationBarController,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.mood),
              title: Text("One"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mood),
              title: Text("Two"),
            ),
          ],
          pinned: true,
        ),
      ),
    );
  }

  void onTap(int index) {
    print("Tapped on $index");
  }
}
