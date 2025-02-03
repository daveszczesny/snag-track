import 'package:flutter/material.dart';

class ProjectListTabWidget extends StatelessWidget {
  
  final TabController tabController;

  const ProjectListTabWidget({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the width of the TabBar based on the content
    final tabWidth = screenWidth * 0.7; // 70% of the screen width

    return Center(
      child: Container(
        width: tabWidth, // Set the container to 70% of screen width
        child: TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true, // Keeps tabs scrollable if needed
          labelPadding: EdgeInsets.symmetric(horizontal: 16.0), // Space between each tab
          tabs: const [
            Tab(text: 'Recent'),
            Tab(text: 'All'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
    );
  }
}