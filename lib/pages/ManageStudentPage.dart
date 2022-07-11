
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/widget/Profile_card.dart';

class ManageStudentPage extends StatefulWidget {

  ManageStudentPage({Key? key}) : super(key: key);

  @override
  State<ManageStudentPage> createState() => _ManageStudentPage();
}

class _ManageStudentPage extends State<ManageStudentPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => (context));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body:  StreamBuilder(
         stream: _firestore.collection("Student").where('status',isEqualTo: "pending").snapshots(),
         builder: (context,snapshot){
           if(!snapshot.hasData){
             return Center(
               child: CircularProgressIndicator(
                 backgroundColor: Colors.lightBlueAccent,
               ),
             );
           }
           final messages=snapshot.data!.docs;
            List<Search_Profile_Card> studentlist=[];
           for (var message in messages){
             Map<String,dynamic> student=message.data();
             studentlist.add(Search_Profile_Card(slist: student));
           }
           return ListView(
             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
             children: studentlist,
           );
         },
       )
        );
  }
}

