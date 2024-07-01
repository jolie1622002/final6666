/// FirstName : "weal"
/// LasttName : "mohames"
/// EscortID : 1
/// Email : "sss@gmail"
/// PhoneNumber : "00000"
/// yourHandel : "scdccd"
/// ProfilePicture : "http://newserver276-production.up.railway.app/media/photos240625/1.webp"
/// Male : true
/// Female : false
/// LastModified : "2024-06-25T18:38:57.975672Z"

class EscortRequest {
  EscortRequest({
      this.firstName, 
      this.lasttName, 
      this.escortID, 
      this.email, 
      this.phoneNumber, 
      this.yourHandel, 
      this.profilePicture,
      this.male, 
      this.female, 
      this.lastModified,});

  EscortRequest.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lasttName = json['LasttName'];
    escortID = json['EscortID'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    yourHandel = json['yourHandel'];
    profilePicture = json['ProfilePicture'];
    male = json['Male'];
    female = json['Female'];
    lastModified = json['LastModified'];
  }
  String? firstName;
  String? lasttName;
  int? escortID;
  String? email;
  String? phoneNumber;
  String? yourHandel;
  String? profilePicture;
  bool? male;
  bool? female;
  String? lastModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LasttName'] = lasttName;
    map['EscortID'] = escortID;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['yourHandel'] = yourHandel;
    map['ProfilePicture'] = profilePicture;
    map['Male'] = male;
    map['Female'] = female;
    map['LastModified'] = lastModified;
    return map;
  }

}