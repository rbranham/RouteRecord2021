import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_record_admin_portal/models/route.dart';
import 'package:route_record_admin_portal/screens/home/routes/route_tile.dart';
import 'package:route_record_admin_portal/services/database.dart';

//Wrapper to set up stream
class RouteListWrapper extends StatelessWidget {
  const RouteListWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<BusRoute>>.value(value: DatabaseService().allRoutes, initialData: [],
    child: RouteList(),
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

    return Column(
      children: [
        Row( //Dropdown row
          children: [

          ],
        ),
        ListView.builder(
            itemCount: busRoutes.length,
            itemBuilder: (context, index) {
              return RouteTile(busRoutes[index]);
            }
        ),
      ],
    );
  }
}
