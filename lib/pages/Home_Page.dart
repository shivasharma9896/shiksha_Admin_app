import 'package:flutter/material.dart';
import '../widget/History_Donation_Card.dart';
import 'AdminCurrentPage.dart';
import 'DonationHistoryPage.dart';
import 'ManageStudentPage.dart';
import 'package:line_icons/line_icons.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int currentIndex=0;
  final screens=[
     AdminCurrentPage(),
     ManageStudentPage(),
     HistoryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        onTap:(index)=> setState(()=>currentIndex=index) ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: 'Manage Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: 'Donation History',
          ),
        ],
        fixedColor: Colors.indigo,
        backgroundColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.white,
      ),
      body: IndexedStack(
        index: currentIndex,
        children:screens,
      ),
    );
  }
}
