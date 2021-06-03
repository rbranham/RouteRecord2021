import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/shared/admin_app_bar.dart';

class RouteEntryWrapper extends StatelessWidget {
  const RouteEntryWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text("Add Route"),),
      body: RouteCreationForm(),
    );
  }
}


class RouteCreationForm extends StatefulWidget {
  const RouteCreationForm({Key key}) : super(key: key);

  @override
  _RouteCreationFormState createState() => _RouteCreationFormState();
}

class _RouteCreationFormState extends State<RouteCreationForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState.validate()) {

                //TODO: Make add call here

                // If the form is valid, display a snackbar as stub.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Route Added')));

                Navigator.pop(context);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
