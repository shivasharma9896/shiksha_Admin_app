
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/widget/Profile_card.dart';

class ManageStudentPage extends StatefulWidget {

  const ManageStudentPage({Key? key}) : super(key: key);

  @override
  State<ManageStudentPage> createState() => _ManageStudentPage();
}

class _ManageStudentPage extends State<ManageStudentPage> {
  final _auth = FirebaseAuth.instance;
  late User loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => (context));
  }


  void getCurrentUser() async {
    try {
      final user = _auth.currentUser!;
      loggedUser = user;
      print("user email");
      print(loggedUser.email);
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                width: 400.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  color: Colors.lime,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              const Search_Profile_Card(),
              const Search_Profile_Card(),
              const Search_Profile_Card(),
              const Search_Profile_Card(),
            ]
        ),
      ),
    );
  }
}
