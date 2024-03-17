import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:warehouse_app/Components/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDashboard extends StatefulWidget {
  static String id = 'user dashboard';

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
    child:Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 0),
    child: Column(
      children: [Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            height: 50,
            child: Image.asset('images/logo_horizontal.png'),
          ),Icon(
            Ionicons.person_circle,
            size: MediaQuery.of(context).size.width * 0.1,
            color: Colors.grey,
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
                margin: const EdgeInsets.fromLTRB(15, 5, 0, 2),
                child:Text(
                    'Your Tasks',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 30.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis
                )
            ),
            Reusable_Card(
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child:Text(
                  'Transferring New Order Items',
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
                    '2021 June 20',
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
              )]),
              onpressed: () {
                // Navigator.pushNamed(context, BillInput.id);
              },
            ),
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
}