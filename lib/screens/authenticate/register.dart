import 'package:flutter/material.dart';
import 'package:route_record_admin_portal/services/auth.dart';
import 'package:route_record_admin_portal/shared/constants.dart';
import 'package:route_record_admin_portal/shared/loading.dart';

class Register extends StatefulWidget {
  //const Register({Key key, this.toggleView}) : super(key: key);

  final Function toggleView;
  //Register({this.toggleView})
  const Register({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(Icons.person), label: Text('Sign In'))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[400])),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),

                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()){
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = 'Please Supply valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )
      ),
    );
  }
}
