import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetail extends StatefulWidget {
  static String id = 'Task Detail';

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
    child:Scaffold(
body: Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  child: Column(
    children: [Text('TEST'),
    Row(
      children: [IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      )],
    ),
      Container(
        width: double.infinity,
        child: Text(
            'Transferring New Order Items New Order Items Transferring ',
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold, fontSize: 19.0,
                color: Colors.black),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 00,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
              // width: double.infinity,
              child: Text(
                'Task ID : ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: Container(
                  // width: double.infinity,
                  child: Text(
                    'T10012',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 15.0,
                        color: Colors.black),
                  ),
                )
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 00,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: double.infinity,
              child: Text(
                'Description : ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: Container(
              // width: double.infinity,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.normal, fontSize: 15.0,
                    color: Colors.black),
              ),
            )
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 00,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Text(
                'Priority : ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Color(0xFFf9d8d8),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:Text(
                    'High',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 15.0,
                        color: Color(0xFFc14143)),
                    overflow: TextOverflow.ellipsis
                )
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 00,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                'Due Date : ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: Container(
                  // width: double.infinity,
                  child: Text(
                    '2021 Jun 4',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.normal, fontSize: 15.0,
                        color: Colors.black),
                  ),
                )
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 00,20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                'Est. Time : ',
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold, fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: Container(
                  // width: double.infinity,
                  child: Text(
                    '4 hours',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.normal, fontSize: 15.0,
                        color: Colors.black),
                  ),
                )
            ),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Text(
              'Status : ',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 15.0,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: Color(0xFFcdf5dd),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              'Completed',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 14.0,
                  color: Color(0xFF13803c)),
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(.08),
                  )
                ],),
              child: TextButton(
                onPressed: () {
                  // Action to perform on button press
                  print('TextButton Pressed!');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFf9d8d8),
                  // foregroundColor: Colors.white,// Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // This makes the button square
                  ),
                ),
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 7.0),
                    child: Text('Reject',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 14.0,
                          color: const Color(0xFFc14143)),)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(.08),
                  )
                ],),
              child: TextButton(
                onPressed: () {
                  // Action to perform on button press
                  print('TextButton Pressed!');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFcdf5dd), // Background color
                  // foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // This makes the button square
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0,vertical: 7.0),
                    child: Text('Accept',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 14.0,
                          color: Color(0xFF13803c)),)),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
    )
    );
  }

}