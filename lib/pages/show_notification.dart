// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShowNotification extends StatefulWidget {
  const ShowNotification({super.key});

  @override
  State<StatefulWidget> createState() {
    return ShowNotificationState();
  }
}

class ShowNotificationState extends State<ShowNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: HexColor('#1A237E'),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: HexColor('#1A237E'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              color: const Color.fromARGB(255, 222, 221, 218),
              child: ListTile(
                leading: Image.asset('images/notification/bag.png'),
                title: const Text(
                  'Hell i am from Laptop which want to say Eid Mubarak.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text(
                  '5 minutes ago',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 222, 221, 218),
              child: ListTile(
                leading: Image.asset('images/notification/tag.png'),
                title: const Text(
                  'You just recieved a notification in which you know how to add a card.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text(
                  'just now',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
