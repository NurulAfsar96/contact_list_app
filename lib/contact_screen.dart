import 'package:contact_list_app/contacts.dart';
import 'package:flutter/material.dart';


class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Map<String, String>> _contacts = [];
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  void _addContact() {
    final name = _nameController.text;
    final number = _numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        _contacts.add({'name': name, 'number': number});
      });
      _nameController.clear();
      _numberController.clear();
    }
  }

  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Confirmation'),
        content: Text('Do you want to delete this contact?'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.blue,),

            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.blue,),
            onPressed: () {
              setState(() {
                _contacts.removeAt(index);
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Number'),
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: _addContact,
              child: Text('Add'),

            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return Contacts(
                  name: _contacts[index]['name']!,
                  number: _contacts[index]['number']!,
                  onLongPress: () => _deleteContact(index),
                );
              },
              //separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
