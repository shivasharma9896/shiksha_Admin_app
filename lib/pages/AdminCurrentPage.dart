import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';

class AdminCurrentPage extends StatefulWidget {
  const AdminCurrentPage({Key? key}) : super(key: key);

  @override
  State<AdminCurrentPage> createState() => _AdminCurrentPageState();
}

class _AdminCurrentPageState extends State<AdminCurrentPage> {
  int registeredDonors=1000;
  int registeredStudents=100;
  int DonationsTodayCount=10;
  int DonationsTodayAmount=100000;
  int TotalDonationCount=1000;
  int TotalDonationsAmount=1000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 100),
            Text("Hola!  Admin ",style: bigTextGreenHeading),
            const SizedBox(height: 50),

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
                      Center(child: Text("${registeredDonors}",style: ContainerData,)),
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
                      Center(child: Text("${registeredStudents}",style: ContainerData,)),
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
                     Center(child: Text("${DonationsTodayCount}",style: ContainerData,)),
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
                  Text("${TotalDonationCount}",style: ContainerData,),
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
