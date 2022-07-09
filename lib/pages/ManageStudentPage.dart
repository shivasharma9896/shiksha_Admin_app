
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/model/Student_model.dart';
import 'package:shiksha_admin_app/widget/Profile_card.dart';

class ManageStudentPage extends StatefulWidget {

  ManageStudentPage({Key? key}) : super(key: key);

  @override
  State<ManageStudentPage> createState() => _ManageStudentPage();
}

class _ManageStudentPage extends State<ManageStudentPage> {
  final _auth = FirebaseAuth.instance;
  late User loggedUser;
  List studentProfileList=[];
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    fetchStudentList();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => (context));
  }
  Future<List> fetchStudentList()async{
  dynamic resultant=await StudentModel().getStudentList();
  if(resultant==null){
    print("unable to retrieve");
  }
  else{
    setState((){
      studentProfileList=resultant;
    });
  }
  return studentProfileList;
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
      body:  Container(
               child: ListView.builder(itemCount: studentProfileList.length,itemBuilder: (context,index){
                 return Search_Profile_Card(slist: studentProfileList[index],);
               })));
  }
}

