import 'package:flutter/material.dart';

import '../../homepage/data/models/person.dart';

class PersonsDetailsPage extends StatefulWidget {
  final Person? person;

  const PersonsDetailsPage({
    Key? key,
    this.person,
  }) : super(key: key);

  @override
  State<PersonsDetailsPage> createState() => _PersonsDetailsPageState();
}

class _PersonsDetailsPageState extends State<PersonsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          widget.person.toString(),
        ),
      ),
    );
  }
}
