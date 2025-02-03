import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/ui/widgets/snag/snag_card_widget.dart';

class ProjectSnagView extends StatefulWidget {
  final Project project;

  const ProjectSnagView({super.key, required this.project});

  @override
  _ProjectSnagView createState() => _ProjectSnagView();
}

class _ProjectSnagView extends State<ProjectSnagView> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Snag> _filterSnags(String status){
    if (status == 'All') {
      return widget.project.snags;
    }
    return widget.project.snags.where((snag) => snag.status.name == status).toList();
  }

  final Set<Snag> _selectedSnags = {};
  void _onSnagSelected(Snag snag, bool isSelected) {
    setState((){
      if (isSelected) {
        _selectedSnags.add(snag);
      }else {
        _selectedSnags.remove(snag);
      }
    });
  }

    Widget _buildSnagList(String status) {
    final snags = _filterSnags(status);

    if (snags.isEmpty) { // snag list is empty
      if (status == 'All') {
        return const Center(child: Text('No snags found'));
      }
      else{
        return const Center(child: Text('No snags found for this status'));
      }
    }

    return ListView.builder(
      itemCount: snags.length,
      itemBuilder: (context, index) {
        Snag snag = snags[index];
        bool isSelected = _selectedSnags.contains(snag);
        return SnagCardWidget(
          snag: snag,
          isSelected: isSelected,
          onSelected: (isSelected) => _onSnagSelected(snag, isSelected)
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'To Do'),
              Tab(text: 'In Progress'),
              Tab(text: 'Resolved'),
              Tab(text: 'Blocked'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSnagList('All'),
                _buildSnagList('To Do'),
                _buildSnagList('In Progress'),
                _buildSnagList('Resolved'),
                _buildSnagList('Blocked'),
              ],
            ),
          )
        ],  
      )
    );
  }
}