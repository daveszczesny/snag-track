import 'package:flutter/material.dart';
import 'package:snag_application_1/ui/screens/notifications_screen.dart';
import 'package:snag_application_1/ui/screens/project_create_form_screen.dart';
import 'package:snag_application_1/ui/screens/project_view_screen.dart';
import 'package:snag_application_1/ui/screens/projects_list_screen.dart';
import 'package:snag_application_1/ui/screens/snag_create_form_screen.dart';
import 'package:snag_application_1/ui/screens/test_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  // List of widgets to be displayed on the main screen
  // Should basically be all pages?
  static const List<Widget> _widgetOptions = <Widget>[
    ProjectListScreen(), // 0
    TestScreen(), // 1
    NotificationsScreen(), // 2
    ProjectListScreen(), // 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onItemTapped(int index) {
    if (index == 3){
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context){
          return FractionallySizedBox(
            heightFactor: 0.3,
            child: _buildBottomSheetContent(),
          );
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Create Project or Snag (QUICK ADD) Bottom Sheet
  Widget _buildBottomSheetContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: ImageIcon(
                  const AssetImage('lib/assets/icons/png/project_icon.png'),
                  size: 100,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectCreateFormScreen(),
                    ),
                  );
                },
              ),
              const Text(
                'Project',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: ImageIcon(
                  const AssetImage('lib/assets/icons/png/snag_icon.png'),
                  size: 100,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SnagCreateFormScreen(),
                    ),
                  );
                },
              ),
              const Text(
                'Snag',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  ),
                ),
            ],
          )
        ]
      ),
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: _selectedIndex,
        onDestinationSelected: onItemTapped,
        destinations: [
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
              ), 
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
              ), 
            label: 'Search'
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 2 ? Icons.notifications : Icons.notifications_outlined,
              ), 
            label: 'Notifications'
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 3 ? Icons.add : Icons.add_outlined,
              ), 
            label: 'Add'
          ),
        ],
      )
    );
  }
}