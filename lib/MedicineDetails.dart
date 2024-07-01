
import 'package:flutter/material.dart';
import 'MEDICINE.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          MainSection(medicine: widget.medicine),
          ExtendedSection(medicine: widget.medicine,),
        ],
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({
    Key? key,
    this.medicine,
  }) : super(key: key);
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Extended(
            TitleField: "Reminder",
            InfoField:
                'Every ${medicine!.interval} hours | ${medicine!.interval == 24 ? "one time a day" : "${(24 / medicine!.interval!).floor()} times  a day "}'),
        Extended(
            TitleField: "Start Time",
            InfoField:
                '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}:${medicine!.startTime![3]}'),
      ],
    );
  }
}

class Extended extends StatelessWidget {
  const Extended(
      {super.key, required this.TitleField, required this.InfoField});
  final String TitleField;
  final String InfoField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              TitleField,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Text(
            InfoField,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({super.key, this.medicine});
  final Medicine? medicine;
  // Hero makeIcon(double size) {
  //   return Hero(
  //     tag: medicine!.medicineName!,
  //     child: Icon(Icons.Tr),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            // Hero(
                // tag: medicine!.medicineName!,
                // child: Material(
                //   color: Colors.transparent,
                //   child: MainInfo(
                //       FieldTitle: 'Medicine Name',
                //       FieldInfo: medicine!.medicineName!),
                // )),
            MainInfo(
                FieldTitle: 'Medicine Name',
                FieldInfo: medicine!.medicineName!),
            MainInfo(
                FieldTitle: 'Dosage',
                FieldInfo: medicine!.dosage == 0
                    ? 'Not Specified'
                    : "${medicine!.dosage} Pills"),
          ],
        );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo(
      {super.key, required this.FieldTitle, required this.FieldInfo});
  final String FieldTitle;
  final String FieldInfo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //
      width: 300,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FieldTitle,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            FieldInfo,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
