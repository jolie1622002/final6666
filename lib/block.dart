import 'package:rxdart/rxdart.dart';
class NewEntryBlock{
  BehaviorSubject<int>? _selectedInterval$;
  BehaviorSubject<int>? get selectIntervals =>_selectedInterval$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay =>_selectedTimeOfDay$;

  NewEntryBlock(){
    _selectedInterval$=
        BehaviorSubject<int>.seeded(0);
    _selectedTimeOfDay$=
        BehaviorSubject<String>.seeded('none');
  }
  void dispose(){
    _selectedInterval$!.close();
    _selectedTimeOfDay$!.close();
  }
  void updateInterval(int interval){
    _selectedInterval$!.add((interval));
  }
  void updateTime(String time){
    _selectedTimeOfDay$!.add((time));
  }
}