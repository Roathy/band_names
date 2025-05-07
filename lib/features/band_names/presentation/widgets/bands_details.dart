import 'package:flutter/material.dart';

import '../../domain/models/band.dart';

class BandsDetails extends StatelessWidget {
  const BandsDetails({super.key, required this.band});

  final Band band;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Text(
          band.name.substring(0, 2),
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      title: Text(band.name),
      trailing: Text(band.votes.toString(), style: TextStyle(fontSize: 15)),
    );
  }
}
