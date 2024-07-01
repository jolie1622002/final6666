class Medicine {
  final List<dynamic>? notiIDs;
  final String? medicineName;
  final int? dosage;
  final int? interval;
  final String? startTime;

  Medicine({
    this.notiIDs,
    this.medicineName,
    this.dosage,
    this.interval,
    this.startTime,
  });
  String get getName => medicineName!;
  int get getDosage => dosage!;
  int get getInterval => interval!;
  String get getStartTime => startTime!;
  List<dynamic> get getNotif => notiIDs!;

  Map<String, dynamic> toJson() {
    return {
      'ids': notiIDs,
      'name': medicineName,
      'dosage': dosage,
      'interval': interval,
      'start': startTime,
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> parsedJSon) {
    return Medicine(
      notiIDs: parsedJSon['ids'],
      medicineName: parsedJSon['name'],
      dosage: parsedJSon['dosage'],
      startTime: parsedJSon['start'],
      interval: parsedJSon['interval'],
    );
  }
}
