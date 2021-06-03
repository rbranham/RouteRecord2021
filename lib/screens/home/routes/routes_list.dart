import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_record_admin_portal/models/route.dart';
import 'package:route_record_admin_portal/screens/home/routes/route_entry.dart';
import 'package:route_record_admin_portal/screens/home/routes/route_tile.dart';
import 'package:route_record_admin_portal/services/database.dart';

//Wrapper to set up stream
class RouteListWrapper extends StatefulWidget {
  const RouteListWrapper({Key key}) : super(key: key);

  @override
  _RouteListWrapperState createState() => _RouteListWrapperState();
}

class _RouteListWrapperState extends State<RouteListWrapper> {

  final List<String> timeOptions = ["All", "Next 2 Weeks", "Last 2 Weeks"];
  final List<String> driverOptions = ["All", "Unassigned"]; //TODO: add on List of drivers from admin
  String time = "All";
  String driver = "All";

  //Use dropdowns to dynamically Choose
  Stream<List<BusRoute>> routeStream = DatabaseService().allRoutes; //TODO: dynamically call the right stream


  @override
  Widget build(BuildContext context) {

    print("Selected Options: $driver and $time");

    return StreamProvider<List<BusRoute>>.value(value: routeStream, initialData: [],
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton<String>(
              value: driver,
              underline: Container(
                height: 2,
                color: Colors.yellowAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  driver = newValue;
                });
              },
              items: driverOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: time,
              underline: Container(
                height: 2,
                color: Colors.yellowAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  time = newValue;
                });
              },
              items: timeOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        Divider(),
        RouteList(),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RouteEntryWrapper()), //Push entry page on top
              );
            } ,
            child: Text("Add Route")
        ),
      ],
    ),
    );
  }
}

//Actual List
class RouteList extends StatefulWidget {
  const RouteList({Key key}) : super(key: key);

  @override
  _RouteListState createState() => _RouteListState();
}

class _RouteListState extends State<RouteList> {
  @override
  Widget build(BuildContext context) {

    final busRoutes = Provider.of<List<BusRoute>>(context);

    return Expanded(
      child: ListView.builder(
                itemCount: busRoutes.length,
                itemBuilder: (context, index) {
                  return RouteTile(busRoutes[index]);
                }
            ),
    );
  }
}
