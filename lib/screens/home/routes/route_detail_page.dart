import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/models/route.dart';


class RouteDetail extends StatelessWidget {

  final BusRoute route;

  RouteDetail({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Assigned / Unassigned logic
    Widget w;
    if (route.driverID == "0"){
      w = Text("Unassigned"); //If unAssigned, eventually put in a button to claim.
    } else {
      w = Text("Assigned to you"); //Assumed will never be seeing someone else route
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("${route.destination} Details"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();                                                     //Different
              },
            )
          ],
        ),
        body:  Center( //Text('Details Page Body for ${route.destination}')
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Destination: ${route.destination}'),
                  Text('Date: ${route.date}'),
                  Text('Scheduled Start Time: ${route.scheduledStartTime}'),
                  Text('Trip Type: ${route.tripType}'),
                  w, //TODO: Unassigned click button to put in a claim request
                  //TODO: If no endtime and assgined to driver, have button to put in end time.
                ],
              ),
            )
        ), //TODO: make details page look better
    );
  }
}


/*

  Use this line in a form later when finished submitting form.
  onPressed: () {
  Navigator.pop(context);
}
 */
