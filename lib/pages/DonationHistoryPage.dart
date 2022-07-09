
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/model/Student_model.dart';
import 'package:shiksha_admin_app/model/transaction.dart';
import 'package:shiksha_admin_app/widget/History_Donation_Card.dart';

class HistoryPage extends StatefulWidget {

  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List donationlist=[];
  @override
  void initState() {
    super.initState();
    fetchStudentList();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => (context));
  }
  Future<List> fetchStudentList()async{
    dynamic resultant=await transaction().gettransList();
    if(resultant==null){
      print("unable to retrieve");
    }
    else{
      setState((){
        donationlist=resultant;
      });
    }
    return donationlist;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:  Container(
            child: ListView.builder(itemCount: donationlist.length,itemBuilder: (context,index){
              return HistoryCard(dlist: donationlist[index],);
            })));
  }
}

