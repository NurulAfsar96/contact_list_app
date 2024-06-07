import 'package:contact_list_app/app_themedata.dart';
import 'package:contact_list_app/contact_screen.dart';
import 'package:flutter/material.dart';





class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Manager',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}
