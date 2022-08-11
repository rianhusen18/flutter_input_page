import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
    required this.value6,
  }) : super(key: key);

  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;
  final String value6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Karyawan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        children: <Widget>[
          ListTile(
            title: Text('NIP : $value1'),
          ),
          ListTile(
            title: Text('Name : $value2'),
          ),
          ListTile(
            title: Text('Address : $value3'),
          ),
          ListTile(
            title: Text('Contact Person : $value4'),
          ),
          ListTile(
            title: Text('Britday : $value5'),
          ),
          ListTile(
            title: Text(
                'Saya setuju dengan dengan ketentuan yang berlaku: $value6'),
          ),
        ],
      ),
    );
  }
}
