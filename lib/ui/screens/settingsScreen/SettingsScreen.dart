import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/settings_page.png', fit:BoxFit.fill,
        width: double.infinity,
      height: double.infinity,),
    );
  }
}
