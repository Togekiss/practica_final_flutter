import 'package:flutter/material.dart';

class KeyValuePairDropdown extends StatefulWidget {
  //Add key-value pair data here
  @override
  KeyValuePairDropdownState createState() {
    return new KeyValuePairDropdownState();
  }
}

class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}


class KeyValuePairDropdownState extends State<KeyValuePairDropdown> {
  List<KeyValueModel> _categories = [
  KeyValueModel(key: "Arts & Theatre", value: "KZFzniwnSyZfZ7v7na"),
  KeyValueModel(key: "Music", value: "KZFzniwnSyZfZ7v7nJ"),
  KeyValueModel(key: "Sports", value: "KZFzniwnSyZfZ7v7nE"),
  KeyValueModel(key: "Film", value: "KZFzniwnSyZfZ7v7nn"),
  KeyValueModel(key: "Undefined", value: "KZFzniwnSyZfZ7v7nl"),
  ];

  String _selectedValue = "";

  @override
  Widget build(BuildContext context) {
     return DropdownButton<String>(
      items: _categories
          .map((data) => DropdownMenuItem<String>(
        child: Text(data.key),
        value: data.value,
      ))
          .toList(),
      onChanged: (String value) {
        setState(() => _selectedValue = value);
      },
      hint: Text('Select Key'),
    );
  }
}
