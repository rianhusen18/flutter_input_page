import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_input_page/ui/detail/page_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nip = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _hp = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _chk = TextEditingController();
  bool? _setuju = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return DetailPage(
                      value1: _nip.text,
                      value2: _nama.text,
                      value3: _alamat.text,
                      value4: _hp.text,
                      value5: _birthday.text,
                      value6: _chk.text,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(8.0), children: <Widget>[
        TextField(
          controller: _nip,
          decoration: InputDecoration(
            labelText: 'Enter your NIP',
            helperText: 'This Is NIP',
            hintText: 'This Is NIP',
            border: const UnderlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                _nip.clear();
                setState(() {});
              },
              icon: const Icon(Icons.clear),
            ),
          ),
          keyboardType: TextInputType.text,
          obscureText: false, //Password
          maxLines: 2,
          minLines: 1,
          maxLength: 10,
          onChanged: ((String value) {
            //setState(() {}); //triget untuk perubahan data ditampilkan
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
          child: TextField(
            controller: _nama,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Name',
              helperText: 'This Is Name',
            ),

            keyboardType: TextInputType.text,
            obscureText: false, //Password
            maxLines: 2,
            minLines: 1,
            maxLength: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
          child: TextField(
            controller: _alamat,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Address',
              helperText: 'This Is Address',
            ),
            keyboardType: TextInputType.text,
            obscureText: false, //Password
            maxLines: 2,
            minLines: 1,
            maxLength: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
          child: TextField(
            controller: _hp,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Cotact Person',
              helperText: 'This Is Cotact Person',
            ),
            keyboardType: TextInputType.text,
            obscureText: false, //Password
            maxLines: 2,
            minLines: 1,
            maxLength: 14,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
              //FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
          child: TextField(
            controller: _birthday,
            decoration: const InputDecoration(
              labelText: 'Britday',
              border: UnderlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              DateTime now = DateTime.now();
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date == null) return;
              _birthday.text = '${date.year}-${date.minute}-${date.day}';
              _birthday.text = '${date.year}'
                  '-${padNumber(date.month)}'
                  '-${padNumber(date.day)}';
            },
          ),
        ),
        CheckboxListTile(
          value: _setuju,
          onChanged: (bool? value) {
            _setuju = value;
            if (_setuju == null) return;
            _chk.text = 'Setuju';
            setState(() {});
          },
          title: const Text('Saya setuju'),
        ),
      ]),
    );
  }

  String padNumber(int number) {
    if (number < 0) return '$number';
    return number > 9 ? '$number' : '0$number';
  }
}
