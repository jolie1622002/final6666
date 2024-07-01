/// FirstName : "mohamed"
/// LasttName : "mahmoud"
/// patientID : 2
/// EscortID : 1
/// DiseaseID : 1
/// Email : "Mohamed.@compit.aun.edu.eg"
/// PhoneNumber : "01068546521"
/// Handel : "FDFD"
/// ProfilePicture:"http://newserver276-production.up.railway.app/media/photos240629/battlefield_4_game_explosion_ea_digital_illusions_ce_92996_1280x720.jpg"
/// Male : true
/// Female : false

class PaitentResponse {
  PaitentResponse({required this.firstName,
      this.lasttName,
      this.patientID,
      this.escortID,
      this.diseaseID,
      this.email,
      this.phoneNumber,
      this.handel,
      this.profilePicture,
      this.male,
      this.female,});

  PaitentResponse.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lasttName = json['LasttName'];
    patientID = json['patientID'];
    escortID = json['EscortID'];
    diseaseID = json['DiseaseID'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    handel = json['Handel'];
    profilePicture = json['ProfilePicture'];
    male = json['Male'];
    female = json['Female'];
  }
  String? firstName;
  String? lasttName;
  int? patientID;
  int? escortID;
  int? diseaseID;
  String? email;
  String? phoneNumber;
  String? handel;
  String? profilePicture;
  bool? male;
  bool? female;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LasttName'] = lasttName;
    map['patientID'] = patientID;
    map['EscortID'] = escortID;
    map['DiseaseID'] = diseaseID;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['Handel'] = handel;
    map['ProfilePicture'] = profilePicture;
    map['Male'] = male;
    map['Female'] = female;
    return map;
  }
}