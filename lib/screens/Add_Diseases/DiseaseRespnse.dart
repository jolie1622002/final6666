/// DiseasesID : 2
/// Deasesname : "Alzheimer's disease"
/// DeasesDiscription : "Not"
/// commen_symptoms : "Not"

class DiseaseResponse {
  DiseaseResponse({
      this.diseasesID,
      this.deasesname, 
      this.deasesDiscription, 
      this.commenSymptoms,});

  DiseaseResponse.fromJson(dynamic json) {
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