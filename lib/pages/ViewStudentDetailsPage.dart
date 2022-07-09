import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewStudent_Page  extends StatefulWidget {
  final Map<String,dynamic> slist;
  const ViewStudent_Page ({Key? key, required this.slist}) : super(key: key);

  @override
  State<ViewStudent_Page> createState() => _ViewStudent_Page();
}

class _ViewStudent_Page extends State<ViewStudent_Page> {
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 50),
           CircleAvatar(
            minRadius: 60,
            maxRadius: 70,
            backgroundImage: NetworkImage(widget.slist['photourl'].toString()),
          ),
          const SizedBox(height: 24,),
          const Text("Personal Information",style: bigTextGreenHeading,),
          Container(
            margin: const EdgeInsets.all(10),
            padding:  EdgeInsets.all(10),
            decoration: limeCard,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Name : ",style: bigTextGreenHeading,),
                    Text(widget.slist['name'],style: mainBlackHeading,),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("DOB : ",style: bigTextGreenHeading,),
                    Text(widget.slist['dob'],style: mainBlackHeading,),
                    SizedBox(width: 30,),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Phone Number : ",style: bigTextGreenHeading,),
                    Text(widget.slist['phonenum'],style: mainBlackHeading,),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Address : ",style: bigTextGreenHeading,),
                    Text(widget.slist['address'],style: mainBlackHeading,),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          const Text("Educational Qualification",style: bigTextGreenHeading,),
          Container(
            margin: const EdgeInsets.all(10),
            padding:  EdgeInsets.all(10),
            decoration: limeCard,
            child: Column(
              children: [
                const SizedBox(height: 24,),
                const Text("SSC Details",style: headingInCard,),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical, //Vertical || Horizontal
                      children: <Widget>[
                        const Text("School Name : ",style: bigTextGreenHeading,),
                        Text(widget.slist['highschoolcollegename'],style: mainBlackHeading,),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Board : ",style: bigTextGreenHeading,),
                    Text(widget.slist['highschoolboard'],style: mainBlackHeading,),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Percenetage : ",style: bigTextGreenHeading,),
                    Text(widget.slist['highschoolpercent'],style: mainBlackHeading,),
                  ],
                ),

                const SizedBox(height: 24,),
                const Text("HSC Details",style: headingInCard,),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical, //Vertical || Horizontal
                      children: <Widget>[
                        const Text("School Name : ",style: bigTextGreenHeading,),
                        Text(widget.slist['intermediatecollegename'],style: mainBlackHeading,),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Board : ",style: bigTextGreenHeading,),
                    Text(widget.slist['intermediateboard'],style: mainBlackHeading,),
                  ],
                ),


                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Percenetage : ",style: bigTextGreenHeading,),
                    Text(widget.slist['intermediatepercent'],style: mainBlackHeading,),
                  ],
                ),
                const SizedBox(height: 24,),
                // const Text("UG Details",style: headingInCard,),
                // const SizedBox(height: 24,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Wrap(
                //       direction: Axis.vertical, //Vertical || Horizontal
                //       children: <Widget>[
                //         const Text("College Name : ",style: bigTextGreenHeading,),
                //         Text(colName,style: mainBlackHeading,),
                //       ],
                //     ),
                //   ],
                // ),
                //
                // const SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     const Text("University : ",style: bigTextGreenHeading,),
                //     Text(colUni,style: mainBlackHeading,),
                //   ],
                // ),
                //
                // const SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     const Text("Passing Year : ",style: bigTextGreenHeading,),
                //     Text(colPassingYear,style: mainBlackHeading,),
                //   ],
                // ),
                // const SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     const Text("Percenetage : ",style: bigTextGreenHeading,),
                //     Text(colPercentage,style: mainBlackHeading,),
                //   ],
                // ),
                // const SizedBox(height: 24),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          GestureDetector(
            onTap: (){
               var imageProvider = NetworkImage(widget.slist['signurl'].toString());
              showImageViewer(context, imageProvider, onViewerDismissed: () {
                print("dismissed");
              });
            },
            child: Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(child: Text("SOP",style: bigTextGreenHeading,)),
            ),
          ),
          GestureDetector(
            onTap: (){
               var imageProvider = NetworkImage(widget.slist['aadharurl'].toString());
              showImageViewer(context, imageProvider, onViewerDismissed: () {
                print("dismissed");
              });
            },
            child:Container(
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(child: Text("Bonafied Letter",style: bigTextGreenHeading,)),
            ),
          ),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                var db = FirebaseFirestore.instance;
                db.collection("Student").doc(widget.slist['uid']).update({'status': "approved"});
                Navigator.pop(context);             },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFE9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child:  Text('Approve',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                var db = FirebaseFirestore.instance;
                db.collection("Student").doc(widget.slist['uid']).update({'status': "blocked"});
                Navigator.pop(context);
              },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFE9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child:  Text('Block',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}



