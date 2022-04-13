import 'package:flutter/material.dart';
import 'package:flutter_presensi_mhs/ui/home/widgets/absen_item_child.dart';

class AbsenItem extends StatelessWidget {
  const AbsenItem({
    Key? key,
    required this.date,
    required this.childItems,
  }) : super(key: key);
  final String date;
  final List<AbsenItemChild> childItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 4.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black),
            ),
          ),
          child: Text(
            date,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontSize: 16.0),
          ),
        ),
        const SizedBox(height: 16.0),
        Column(
          children: childItems,
        )
      ],
    );
  }
}
