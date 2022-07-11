import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';
import 'package:shiksha_admin_app/pages/ViewStudentDetailsPage.dart';
class Search_Profile_Card extends StatefulWidget {
   Search_Profile_Card( {Key? key, required this.slist,  }) : super(key: key);
  final Map<String,dynamic> slist;

  @override
  State<Search_Profile_Card> createState() => _Search_Profile_CardState();
}

class _Search_Profile_CardState extends State<Search_Profile_Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.pushNamed(context, '/student-profile');
      },
      child: Container(
        margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(top: 10),
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[200],
          ),
          child: Column(
            children:[
              Row(
                children:  [
                  const SizedBox(width: 20,),
                   CircleAvatar(
                        minRadius: 30,
                        maxRadius: 40,
                        backgroundImage: NetworkImage(widget.slist['photourl']),
                  ),
                  const SizedBox(width: 70,),
                  Column(
                    children: [
                       Text(widget.slist['name'],style:mainBlackHeading),
                      const SizedBox(height: 15,),
                      Row(
                        children:  [
                          Text("Applied For : ",style: smallBlackHeading),
                          Text(widget.slist['appFor']),
                        ],
                      ),
                      Row(
                        children:  [
                          Text("Aid Amount : ", style: smallBlackHeading),
                          Text(widget.slist['amountReq'].toString()),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(this.context, MaterialPageRoute(builder: (context) => ViewStudent_Page(slist: widget.slist,)), );
                  },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFFE9EF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child:  Text('Check Profile',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}

