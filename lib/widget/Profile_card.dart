import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shiksha_admin_app/constants.dart';
class Search_Profile_Card extends StatefulWidget {
  const Search_Profile_Card({Key? key}) : super(key: key);

  @override
  State<Search_Profile_Card> createState() => _Search_Profile_CardState();
}

class _Search_Profile_CardState extends State<Search_Profile_Card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/student-profile');
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
                  const CircleAvatar(
                        minRadius: 30,
                        maxRadius: 40,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 70,),
                  Column(
                    children: [
                      const Text("Kendal Jenner",style:mainBlackHeading),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          Text("Qualification : ",style:smallBlackHeading),
                          Text("BCA"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("Applied For : ",style: smallBlackHeading),
                          Text("BCA"),
                        ],
                      ),
                      Row(
                        children: const [
                          Text("Aid Amount : ", style: smallBlackHeading),
                          Text("Rs. 1,00,0000"),
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
                  ElevatedButton(onPressed: (){},
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
                  ElevatedButton(onPressed: (){},
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
            ],
          ),
        ),
    );
  }
}

