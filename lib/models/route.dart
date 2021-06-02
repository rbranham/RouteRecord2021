class BusRoute{

  final String date;
  final String scheduledStartTime;
  String endTime;
  final String destination;
  final String tripType;

  final String driverID;
  final String adminID;
  final String schoolID;

  final String unAssignedString = "0";

  BusRoute({this.driverID = "0", this.adminID = "0", this.schoolID = "0", this.date, this.scheduledStartTime, this.destination, this.tripType});

  //Serializable Functions
  BusRoute.fromJson(Map<String, Object> json) //Removed Nullable features from doc example... be careful! //TODO: <- Update this to nullable standards
      : this(
    date: json['date'] as String,
    scheduledStartTime: json['scheduledStartTime'] as String,
    // endTime: json['endTime'] as String, //TODO: Find solution for end time, can just use a special null String like "0" for ids
    destination: json['destination'] as String,
    tripType: json['tripType'] as String,
    driverID: json['driverID'] as String,
    adminID: json['adminID'] as String,
    schoolID: json['schoolID'] as String,
  );

  Map<String, Object> toJson() {
    return {
    'date' : date,
    'scheduledStartTime' : scheduledStartTime,
      // TODO: add in in endTime later
    'destination' : destination,
    'tripType' : tripType,
    'driverID' : driverID,
    'adminID' : adminID,
    'schoolID' : schoolID,
    'unAssignedString' : unAssignedString
    };
  }
}