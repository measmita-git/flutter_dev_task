import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ExpandableNavbar extends StatefulWidget {
  @override
  _ExpandableNavbarState createState() => _ExpandableNavbarState();
}

class _ExpandableNavbarState extends State<ExpandableNavbar> {
  Color moreIconColor = Colors.grey;
  bool isExpanded = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _expandedIcons = [
      IconButton(icon: Icon(Icons.email), onPressed: () {}),
      IconButton(icon: Icon(Icons.help), onPressed: () {}),
    ];

    return Scaffold(
      body: const Center(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  // BottomNavigationHomePage(),
                  // BottomNavigationPropertiesPage(),
                  // BottomNavigationExplorePage(),
                  // BottomNavigationMorePage(),
                ],
              ),
            ),
            if (isExpanded)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _expandedIcons,
              ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTabIcon(Icons.home, 0, 'Home'),
                buildTabIcon(Icons.menu, 1, 'Menu'),
                buildTabIcon(Icons.circle, 2, 'Explore'),
                IconButton(
                  icon: Icon(isExpanded ? Icons.close : Icons.more),
                  color: moreIconColor,
                  onPressed: () {
                    setState(() {
                      if (selectedIndex == 3) {
                        isExpanded = !isExpanded;
                      } else {
                        selectedIndex = 3;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabIcon(IconData iconData, int tabIndex, String label) {
    return IconButton(
      icon: Icon(iconData),
      color: selectedIndex == tabIndex ? Colors.red : Colors.grey,
      onPressed: () {
        setState(() {
          selectedIndex = tabIndex;
        });
      },
      tooltip: label,
    );
  }
}
