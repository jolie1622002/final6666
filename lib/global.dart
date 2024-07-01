import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MEDICINE.dart';

class GlobalBloc {
  BehaviorSubject<List<Medicine>>? _medicineList$;
  BehaviorSubject<List<Medicine>> get medicineList$ => _medicineList$!;

  GlobalBloc() {
    _medicineList$ = BehaviorSubject<List<Medicine>>.seeded([]);
    _loadMedicineList();
  }

  Future updateMedicineList(Medicine newMedicine) async {
    var blockList = medicineList$!.value;
    blockList.add(newMedicine);
    _medicineList$!.add(blockList);
    Map<String, dynamic> tempMap = newMedicine.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode((tempMap));
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicines') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList(('medicines'))!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList("medicine", medicineJsonList);
  }

  Future<void> _loadMedicineList() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<Medicine> prefList = [];
    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = json.decode(jsonMedicine);
        Medicine tempMedicine = Medicine.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      _medicineList$!.add(prefList);
    }
  }

  void addMedicine(Medicine medicine) {
    final currentList = _medicineList$!.value;
    currentList.add(medicine);
    _medicineList$!.add(currentList);
    _saveMedicineList(currentList);
  }

  // void removeMedicine(Medicine medicine) {
  //   final currentList = _medicineList$!.value;
  //   currentList.remove(medicine);
  //   _medicineList$!.add(currentList);
  //   _saveMedicineList(currentList);
  // }

  Future<void> _saveMedicineList(List<Medicine> medicineList) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> jsonList =
        medicineList.map((medicine) => json.encode(medicine.toJson())).toList();
    await sharedUser.setStringList('medicines', jsonList);
  }

  void dispose() {
    _medicineList$!.close();
  }
}
