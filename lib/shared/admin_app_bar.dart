import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/screens/home/home.dart';
import 'package:route_record_admin_portal/services/auth.dart';

class AdminAppBar extends AppBar {

  //final AuthService _auth = AuthService();

  AdminAppBar({Key key, Widget title}) : super(key: key,
    title: title,
    elevation: 0.0,
    actions: <Widget>[
      TextButton(
        child: Text("Routes"),
        onPressed: () {
          print("go to route");
          //TODO need build context??
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Home(Home.ROUTE)),
          // );
        },
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      ),
      TextButton(
        child: Text("Drivers"),
        onPressed: () {
          print("go to drivers"); //TODO: refactor with navigation
        },
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      ),
      TextButton(
        child: Text("schools"),
        onPressed: () {
          print("go to schools"); //TODO: refactor with navigation
        },
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      ),
      FlatButton.icon( //TODO: Update button to a non depreciated version
        icon: Icon(Icons.person),
        label: Text('logout'),
        onPressed: () async {
          await AuthService().signOut();
        },
      )
    ],
  );
}


///////////////////////////////////////////////////////////////////////////\\\\

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  CustomAppBar({Key key, this.title}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState(this.title);
}

class _CustomAppBarState extends State<CustomAppBar>{

  Widget title;

  _CustomAppBarState(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      elevation: 0.0,
      actions: <Widget>[
        TextButton(
          child: Text("Routes"),
          onPressed: () {
            print("go to route");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home(bodyKey: Home.ROUTE)),
            );
          },
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        TextButton(
          child: Text("Drivers"),
          onPressed: () {
            print("go to drivers");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home(bodyKey: Home.DRIVER)),
            );
          },
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        TextButton(
          child: Text("schools"),
          onPressed: () {
            print("go to schools");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home(bodyKey: Home.SCHOOL)),
            );
          },
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        ),
        FlatButton.icon( //TODO: Update button to a non depreciated version
          icon: Icon(Icons.person),
          label: Text('logout'),
          onPressed: () async {
            await AuthService().signOut();
          },
        )
      ],
    );
  }
}