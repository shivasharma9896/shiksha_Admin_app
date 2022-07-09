import 'package:flutter/material.dart';
import 'package:shiksha_admin_app/constants.dart';
class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, required this.dlist}) : super(key: key);
  final Map<String,dynamic> dlist;
  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
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
                   Text("Donor Name : "+widget.dlist['DonorName'],style:ContainerData),
                  const SizedBox(height: 15,),
                  Row(
                    children:  [
                      Text("Amount Donated : ", style: ContainerHeading),
                      Text(widget.dlist['DonatedAmount']),
                    ],
                  ),
                  const SizedBox(height: 15,),
                   Text("Student Name : "+widget.dlist['StudentName'],style:ContainerData),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

