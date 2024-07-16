import 'package:flutter/material.dart';
import '../../core/widgets/common_widgets.dart';
import '../widget/dashboard_item.dart';
import 'HomeScreen.dart';

class DashboardScreen extends StatefulWidget {

   const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: appBarAndBackButton(
         "Home", context, true, true),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: SingleChildScrollView(
            child: ActivityItem(),
          ),
        ),
      ),
    );
  }
}
