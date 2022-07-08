import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';
class History_Profile_Card extends StatefulWidget {
  const History_Profile_Card({Key? key}) : super(key: key);

  @override
  State<History_Profile_Card> createState() => _History_Profile_CardState();
}

class _History_Profile_CardState extends State<History_Profile_Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(top: 10),
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        children:[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Column(
                children: [
                  SizedBox(height: 13,),
                  const Text("Donor Name : Kendal Jenner",style:ContainerData),
                  const SizedBox(height: 15,),
                  Row(
                    children: const [
                      Text("Amount Donated : ", style: ContainerHeading),
                      Text("Rs 50,000"),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Text("Student Name : Kendal Jenner",style:ContainerData),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

