import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String tabName;
   MyTab({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 150,
      child: Container(
        padding: EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //     color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        child: Text(tabName)
      ),
    );
  }
}