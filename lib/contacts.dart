import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final String name;
  final String number;
  final VoidCallback onLongPress;

  Contacts({
    required this.name,
    required this.number,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      child: Card(
        color: Colors.grey.shade100,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(Icons.person, size: 42,),
          iconColor: Colors.blueAccent,
          title: Text(name, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, color: Colors.redAccent)),
          subtitle: Text(number, style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.phone, color: Colors.blue),
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
