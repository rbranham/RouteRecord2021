import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/models/route.dart';
import 'package:route_record_admin_portal/screens/home/routes/route_detail_page.dart';

class RouteTile extends StatelessWidget {

  final BusRoute route;

  RouteTile(this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar( //TODO: Make this based on trip type?
            radius: 25.0,
            backgroundColor: Colors.blue,
          ),
          title: Text(route.destination),
          subtitle: Text('${route.date} - ${route.scheduledStartTime}'),
          onTap: () {
            print("Opening details page for: ${route.destination}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RouteDetail(route: route,)),
            );
          },
        ),
      ),
    );
  }
}
