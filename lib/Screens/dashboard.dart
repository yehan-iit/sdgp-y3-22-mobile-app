import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:warehouse_app/Components/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse_app/Screens/task_detal.dart';
import 'login_screen.dart';

class UserDashboard extends StatefulWidget {
  static String id = 'user dashboard';

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
    child:Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
    child: Column(
      children: [Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            height: 50,
            child: Image.asset('images/logo_horizontal.png'),
          ),IconButton(
            icon: Icon(
              Ionicons.person_circle,
              size: MediaQuery.of(context).size.width * 0.1,
              color: Colors.grey,
            ),
              onPressed: () => {

              showCustomAlertDialog(context)
              },
          ),]
            ),
      ),
        Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0,15, 0, 0),
        decoration: const BoxDecoration(
            color: Color(0xFFF2F4F5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                child:Text(
                    'Your Tasks',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 30.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis
                )
            ),
            TaskCard(title: 'Transferring New Order Items', priority: 'High', date: '2021 June 20', status: 'Assigned'),
            TaskCard(title: 'Shipping Orders', priority: 'Medium', date: '2021 June 20', status: 'Started'),
            TaskCard(title: 'Picking New Orders', priority: 'Medium', date: '2021 June 20', status: 'Completed'),
            TaskCard(title: 'Removing Shipment From Bay', priority: 'Low', date: '2021 June 20', status: 'Completed'),
            TaskCard(title: 'Removing Shipment From Bay', priority: 'Low', date: '2021 June 20', status: 'Completed'),
          ],
        ),
        )
      )
        )
        ,])

      )
    ),
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
 final String status;
 final String date;
 final String priority;
 final String title;
  TaskCard({required this.title, required this.priority,required this.date,required this.status});

  @override
  Widget build(BuildContext context) {
    Color priorityContColor = Colors.black;
    Color priorityColor = Colors.white;

    Color statusContColor = Colors.black;
    Color statusColor = Colors.white;

    if (priority == 'High') {
      priorityContColor = Color(0xFFf9d8d8);
      priorityColor = Color(0xFFc14143);
    } else if (priority == 'Medium') {
      priorityContColor = Color(0xFFfaeecf);
      priorityColor = Color(0xFF896e2d);
    } else if (priority == 'Low') {
      priorityContColor = Color(0xFFebf2fd);
      priorityColor = Color(0xFF6a88fe);
    }

    if (status == 'Assigned') {
      statusContColor = Color(0xFFe9e5ff);
      statusColor = Color(0xFF7d5eff);
    } else if (status == 'Completed') {
      statusContColor = Color(0xFFcdf5dd);
      statusColor = Color(0xFF13803c);
    } else if (status == 'Started') {
      statusContColor = Color(0xFFfff0d4);
      statusColor = Color(0xFFf99420);
    }

    return ReusableCard(
      cardchild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child:Text(
                  title,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 19.0,
                      color: Colors.black),
                  overflow: TextOverflow.ellipsis
              )
          ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: priorityContColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:Text(
                    priority,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 15.0,
                        color: priorityColor),
                    overflow: TextOverflow.ellipsis
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children: [
                      Icon(
                        Ionicons.time_outline,
                        size: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5,),
                      Text(
                          date,
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis
                      ),
                    ]
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusContColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 14.0,
                        color: statusColor),
                  ),
                ),
              ],
            )]),
      onpressed: () {
        Navigator.pushNamed(context, TaskDetail.id);
      },
    );
  }
}

