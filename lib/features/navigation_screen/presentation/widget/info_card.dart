import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          )),
      title: Text(
        "${firstName} ${lastName}",
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
            ),
      ),
      subtitle: Text(
        "Premium Client",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
