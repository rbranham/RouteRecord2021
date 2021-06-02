import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/screens/home/routes/routes_list.dart';
import 'package:route_record_admin_portal/services/auth.dart';
import 'package:route_record_admin_portal/shared/admin_app_bar.dart';

class Home extends StatelessWidget {

  int bodyKey;

  Home({Key key, this.bodyKey}) : super(key: key);

  static const int ROUTE = 0;
  static const int DRIVER = 1;
  static const int SCHOOL = 2;


  @override
  Widget build(BuildContext context) {

    print("bodyKey is: $bodyKey");

    Widget b;
    Text t;

    switch(bodyKey){
      case (ROUTE):
        {
          b = RouteListWrapper();
          t = Text("Route List");
        }
        break;
      case (DRIVER):
        {
          b = Text("Driver List");
          t = Text("Driver List");
        }
        break;
      case (SCHOOL):
        {
          b = Text("School List");
          t = Text("School List");
        }
        break;
      default:
        {
          b = RouteListWrapper();
          t = Text("Route List");
        }
    }



    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: CustomAppBar(title: t), //title: Text("Route List")
      body: b,
    );

  }
}
