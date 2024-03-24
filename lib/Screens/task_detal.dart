import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDetail extends StatefulWidget {
  static String id = 'Task Detail';

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  Widget? getButtons(status) {
    if (status == 'Assigned') {
      return Row(
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
       );
    } else if (status == 'Started') {
        return Row(
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
                    child: Text('Abort',
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
                    child: Text('Complete',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 14.0,
                          color: Color(0xFF13803c)),)),
              ),
            ),
          ],
           );
    } else {
      return null;
    }

  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Color priorityContColor = Colors.black;
    Color priorityColor = Colors.white;

    Color statusContColor = Colors.black;
    Color statusColor = Colors.white;

    if (args['priority'] == 'High') {
      priorityContColor = Color(0xFFf9d8d8);
      priorityColor = Color(0xFFc14143);
    } else if (args['priority'] == 'Medium') {
      priorityContColor = Color(0xFFfaeecf);
      priorityColor = Color(0xFF896e2d);
    } else if (args['priority'] == 'Low') {
      priorityContColor = Color(0xFFebf2fd);
      priorityColor = Color(0xFF6a88fe);
    }

    if (args['status'] == 'Assigned') {
      statusContColor = Color(0xFFe9e5ff);
      statusColor = Color(0xFF7d5eff);
    } else if (args['status'] == 'Completed') {
      statusContColor = Color(0xFFcdf5dd);
      statusColor = Color(0xFF13803c);
    } else if (args['status'] == 'Started') {
      statusContColor = Color(0xFFfff0d4);
      statusColor = Color(0xFFf99420);
    }
    return WillPopScope(
        onWillPop: () async => true,
    child:Scaffold(
body: Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  child: Column(
    children: [Row(
      children: [IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      )],
    ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                args['title'],
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
                          args['id'].toString(),
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
                        args['description'],
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
                        color: priorityContColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child:Text(
                          args['priority'],
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold, fontSize: 15.0,
                              color: priorityColor),
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
                          args['date'],
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
                          '${args['estTime']} hours',
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
                    color: statusContColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    args['status'],
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 14.0,
                        color: statusColor),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: getButtons( args['status'])
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