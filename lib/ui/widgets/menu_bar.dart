import 'package:flutter/material.dart';
import 'package:snag_application_1/ui/screens/main_screen.dart';
import 'package:snag_application_1/ui/screens/notifications_screen.dart';
import 'package:snag_application_1/ui/screens/project_create_form_screen.dart';
import 'package:snag_application_1/ui/screens/projects_list_screen.dart';
import 'package:snag_application_1/ui/screens/snag_create_form_screen.dart';
import 'package:snag_application_1/ui/screens/test_screen.dart';

// THIS FILE SHOULD NOT BE USED ANYWHERE
// TODO: REMOVE THIS FILE


class MenuBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MenuBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _MenuBarState createState() => _MenuBarState();
}


class _MenuBarState extends State<MenuBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(
            widget.selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          ),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            widget.selectedIndex == 1 ? Icons.search : Icons.search_outlined,
          ),
          label: 'Search',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            widget.selectedIndex == 2 ? Icons.notifications : Icons.notifications_outlined,
          ),
          label: 'Notifications',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            widget.selectedIndex == 3 ? Icons.add : Icons.add_outlined,
          ),
          label: 'Add',
        )

      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      showUnselectedLabels: true,
    );
  }
}