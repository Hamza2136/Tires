// ignore: file_names
// ignore_for_file: sized_box_for_whitespace, file_names, duplicate_ignore, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShowSettings extends StatefulWidget {
  const ShowSettings({super.key});

  @override
  State<StatefulWidget> createState() {
    return ShowSettingsState();
  }
}

class ShowSettingsState extends State<ShowSettings> {
  bool isNotificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint('hahaha1');
                },
                child: Row(
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('#404F68'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: HexColor('#404F68'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('hahaha2');
                },
                child: Row(
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('#404F68'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: HexColor('#404F68'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('hahaha3');
                },
                child: Row(
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('#404F68'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: HexColor('#404F68'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('hahaha4');
                },
                child: Row(
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('#404F68'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: HexColor('#404F68'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: HexColor('#404F68'),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Switch(
                    value: isNotificationOn,
                    onChanged: (value) {
                      setState(() {
                        isNotificationOn = value;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: HexColor('#D32F2F'),
                    activeTrackColor: HexColor('#D32F2F'),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Logout');
                },
                child: Row(
                  children: [
                    Text(
                      'LogOut',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: HexColor('#404F68'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.power_settings_new,
                      color: HexColor('#404F68'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
