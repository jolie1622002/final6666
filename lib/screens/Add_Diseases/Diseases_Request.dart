  /// DiseasesID : 1
/// Deasesname : "suger"
/// DeasesDiscription : "sss"
/// commen_symptoms : "nnn"

class DiseasesRequest {
  DiseasesRequest({
      this.diseasesID,
      this.deasesname,
      this.deasesDiscription,
      this.commenSymptoms,});

  DiseasesRequest.fromJson(dynamic json) {
    diseasesID = json['DiseasesID'];
    deasesname = json['Deasesname'];
    deasesDiscription = json['DeasesDiscription'];
    commenSymptoms = json['commen_symptoms'];
  }
  int? diseasesID;
  String? deasesname;
  String? deasesDiscription;
  String? commenSymptoms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DiseasesID'] = diseasesID;
    map['Deasesname'] = deasesname;
    map['DeasesDiscription'] = deasesDiscription;
    map['commen_symptoms'] = commenSymptoms;
    return map;
  }

}