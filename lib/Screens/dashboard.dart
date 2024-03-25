import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:warehouse_app/Components/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse_app/Screens/task_detal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class UserDashboard extends StatefulWidget {
  static String id = 'user dashboard';

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  List<String> statuses = ['Created','Assigned','Started', 'Completed','Bug','Cancelled'];
  List<TaskCard>? _taskCardsList;

  Future<List<TaskCard>> getUserTasks() async {

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');


    var response = await http.post(Uri.parse('https://smartallocbe.azurewebsites.net/task/peruser'),
        headers: {"Authorization": "Bearer $accessToken","Content-Type": "application/json"});

    if (response.statusCode == 401) {
      // Unauthorized, throw an exception
      print('Unauthorized');
      throw Exception('Unauthorized');
    }

    var tasks = jsonDecode(response.body);

    List<TaskCard> taskCards= [];
    for (var task in tasks) {
      taskCards.add(TaskCard(id: task['id'],title: task['title'], priority: task['priority'], date: parseAndFormatDate(task['deadline']), status: statuses[task['status']],description: task['description'],estTime: task['allocatedTime']));
    }

    return taskCards;
  }

  String parseAndFormatDate(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);

    DateFormat outputFormat = DateFormat('dd MMMM yyyy');

    String formattedDate = outputFormat.format(parsedDate);

    return formattedDate;
  }

  void fetchInitialData() async {
    try {
      var tasks = await getUserTasks();
      setState(() {
        _taskCardsList = tasks;
      });
    } on Exception catch (e) {
      print(e.toString());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Navigate to the login screen or another appropriate screen
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      });
    }

  }

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

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
        child: RefreshIndicator(
          onRefresh: () async {
            fetchInitialData();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
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
               FutureBuilder<List<TaskCard>>(future: getUserTasks(), builder: (context,snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator while waiting for the data
                  return Container(
                      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width * 0.5, 0,0),
                      child: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  String errorString = snapshot.error.toString();
                  if (errorString.contains('Unauthorized')) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // Navigate to the login screen or another appropriate screen
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    });
                  }
                  print('Error: ${snapshot.error}');
                    return Text('Error: ${snapshot.error}');
                } else {
                  return Column(children: snapshot.data!);
                }
              }),
            ],
          ),
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

class TaskCard extends StatelessWidget {final String status;
 final int id;
 final String date;
 final String priority;
 final String title;
final String description;
final int estTime;
  TaskCard({required this.id,required this.title, required this.priority,required this.date,required this.status,required this.description,required this.estTime});

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
        Navigator.pushNamed(context, TaskDetail.id,arguments: {
          'id': id,
          'title': title,
          'priority': priority,
          'date': date,
          'status': status,
          'description': description,
          'estTime': estTime,
        },);
      },
    );
  }
}

