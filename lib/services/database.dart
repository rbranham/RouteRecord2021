import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:route_record_admin_portal/models/route.dart';

class DatabaseService {

  CollectionReference adminCollection = FirebaseFirestore.instance.collection('admins');
  CollectionReference routeCollection = FirebaseFirestore.instance.collection('Routes').withConverter<BusRoute>(
    fromFirestore: (snapshot, _) => BusRoute.fromJson(snapshot.data()),
    toFirestore: (route, _) => route.toJson(),
  );

  final String uid;
  DatabaseService({ this.uid });

  //TODO: Fix this with admin fields
  Future updateUserData(String sugars, String name, int strength) async {

    return await adminCollection.doc(uid).set({
      'sugar' : sugars,
      'name' : name,
      'strength' : strength
    });

  }

  //----------------------------------Routes------------------------------- \\

  //Add Route
  Future addRoute(BusRoute r){

    return routeCollection.add(r)
        .then((value) => print("Bus Route ${r.destination} Added"))
        .catchError((error) => print("Failed to add bus route: $error"));

  }

  //Used to convert a route Query snapshot into a bust route list.
  List<BusRoute> _busRouteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doc.data() as BusRoute;
    }).toList();
  }

  //STREAM VERSION
  Stream<List<BusRoute>> get allRoutes {
    //return _busRouteListFromSnapshot(routeCollection.snapshots()); //This way doesn't return a stream for some reason?
    Query adminOnly = routeCollection.where('adminID', isEqualTo: uid);
    return adminOnly.snapshots()//Should only get ones with matching admin id
        .map(_busRouteListFromSnapshot);
  }

  //
  // //NON STREAM VERSION
  // Future<List<BusRoute>> getAllDriverRoutes(){
  //   //Query to grab all routes in route collection where driverID matches
  //   return routeCollection
  //       .where('driverID', isEqualTo: this.uid)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //         return _busRouteListFromSnapshot(querySnapshot);
  //   })
  //       .catchError((error) => print("Failed to get Bus Routes for Driver: $error"));
  // }

}