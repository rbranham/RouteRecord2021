import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_record_admin_portal/models/local_user.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final localUser = Provider.of<LocalUser>(context); // gets local user from stream
    print(localUser);

    //return either Home or Auth widget
    if(localUser == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}