import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';
import 'package:shiksha_admin_app/model/Donor_model.dart';
import 'package:shiksha_admin_app/model/Student_model.dart';

import '../model/transaction.dart';

class AdminCurrentPage extends StatefulWidget {
  const AdminCurrentPage({Key? key}) : super(key: key);

  @override
  State<AdminCurrentPage> createState() => _AdminCurrentPageState();
}

class _AdminCurrentPageState extends State<AdminCurrentPage> {
  List donationlist=[];
  List studentlist=[];
  List donorlist=[];
  List todaydonationlist=[];
  int TotalDonationsAmount=0;
  int DonationsTodayAmount=0;
  @override
  void initState() {
    super.initState();
    fetchDonationList();
    fetchStudentList();
    fetchDonorList();
    fetchTodayDonation();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => (context));
  }
  Future<List> fetchDonationList()async{
    dynamic resultant=await transaction().gettransList();
    if(resultant==null){
      print("unable to retrieve");
    }
    else{
      setState((){
        donationlist=resultant;
        CalcTotalDonation();
      });
    }
    return donationlist;
  }
  Future<List> fetchTodayDonation()async{
    dynamic resultant=await transaction().getTodaytransList();
    if(resultant==null){
      print("unable to retrieve");
    }
    else{
      setState((){
        todaydonationlist=resultant;
        CalcTodayTotalDonation();
      });
    }
    return todaydonationlist;
  }
  Future<List> fetchStudentList()async{
    dynamic resultant=await StudentModel().getTotalStudentList();
    if(resultant==null){
      print("unable to retrieve");
    }
    else{
      setState((){
        studentlist=resultant;
      });
    }
    return studentlist;
  }

  Future<List> fetchDonorList()async{
    dynamic resultant=await DonorModel().getTotalDonorList();
    if(resultant==null){
      print("unable to retrieve");
    }
    else{
      setState((){
        donorlist=resultant;
      });
    }
    return donorlist;
  }
  Future CalcTotalDonation() async {
    for(int i=0;i<donationlist.length;i++){
      TotalDonationsAmount+=int.parse(donationlist[i]['DonatedAmount']);
    }
  }
  Future CalcTodayTotalDonation() async {
    for(int i=0;i<todaydonationlist.length;i++){
      DonationsTodayAmount+=int.parse(todaydonationlist[i]['DonatedAmount']);
    }
  }




  @override
  Widget build(BuildContext context) {
    final _auth=FirebaseAuth.instance;
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 50),
            Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FloatingActionButton(onPressed: (){
                          _auth.signOut();
                          Navigator.pop(context);
                        },child: Icon(Icons.logout_rounded),),
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 20),
            Text("Hola!  Admin ",style: bigTextGreenHeading),
            const SizedBox(height: 20),

            Row(
              children: [

                 Container(
                  height: 140,
                  width: 160,
                  margin: const EdgeInsets.all(10),
                  decoration: ContainerDecor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: Text("Registered Donors",style: ContainerHeading,)),
                      Center(child: Text("${donorlist.length}",style: ContainerData,)),
                    ],
                  )
                ),
                 Container(
                  height: 140,
                  width: 160,
                  margin: const EdgeInsets.all(10),
                  decoration: ContainerDecor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(child: Text("Registered Students",style: ContainerHeading,)),
                      Center(child: Text("${studentlist.length}",style: ContainerData,)),
                    ],
                  )
                ),
              ],
            ),
           SizedBox(height: 20,),
           Row(
             children: [
               Container(
                 height: 140,
                 width: 160,
                 margin: const EdgeInsets.all(10),
                 decoration: ContainerDecor,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Center(child: Text("Today's Donation Count",style: ContainerHeading,)),
                     Center(child: Text("${todaydonationlist.length}",style: ContainerData,)),
                   ],
                 )
               ),
               Container(
                 height: 140,
                 width: 160,
                 margin: const EdgeInsets.all(10),
                 decoration: ContainerDecor,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Center(child: Text("Today's Donation Amount",style: ContainerHeading,)),
                     Center(child: Text("Rs.${DonationsTodayAmount}",style: ContainerData,)),
                   ],
                 )
               ),
             ],
           ),
            SizedBox(height: 20,),

            Container(
              height: 210,
              width: 320,
              margin: const EdgeInsets.all(10),
              decoration: ContainerDecor,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                   Text("Total Donation Count",style: ContainerHeading,),
                  SizedBox(height: 5,),
                  Text("${donationlist.length}",style: ContainerData,),
                  SizedBox(height: 20,),
                   Text("Total Money Donated",style: ContainerHeading,),
                  SizedBox(height: 5,),
                  Text("Rs.${TotalDonationsAmount}",style: ContainerData,),

                ],
              ),
            ),
          ]
      ),
    );
  }
}
