import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:form/data_pendaftaran.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _form();
}

class _form extends State<form> {
  int _value = 0;
  var formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final alamat = TextEditingController();
  final asal = TextEditingController();
  final tempat = TextEditingController();
  final tanggal = TextEditingController();
  final dateController = TextEditingController();
  final radio = TextEditingController();

  void inistate() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pendaftaran')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                _textboxnama(),
                SizedBox(
                  height: 16,
                ),
                _textboxalamat(),
                SizedBox(
                  height: 16,
                ),
                _textboxasal(),
                SizedBox(
                  height: 16,
                ),
                _textboxtempat(),
                SizedBox(
                  height: 16,
                ),
                _textboxtanggal(),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                _textboxradio(),
                _textboxradio2(),
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                _textboxtombol()
              ]),
            )),
      ),
    );
  }

  _textboxnama() {
    return TextField(
        controller: name,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Nama",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ));
  }

  _textboxalamat() {
    return TextField(
        controller: alamat,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "alamat",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ));
  }

  _textboxasal() {
    return TextField(
        controller: asal,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "asal",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ));
  }

  _textboxtempat() {
    return TextField(
        controller: tempat,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Tempat lahir",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ));
  }

  _textboxtanggal() {
    return TextField(
        controller: dateController, //editing controller of this TextField
        decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Enter Date" //label text of field
            ),
        readOnly: true, // when true user cannot edit text
        onTap: () async {
          //when click we have to show the datepicker

          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(), //get today's date
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            setState(() {
              dateController.text = pickedDate.toString();
            });
          } else {
            print("Tidak Terpilih");
          }
        });
  }

  _textboxradio() {
    return Row(
      children: [
        Radio(
            value: 1,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            }),
        SizedBox(
          width: 10.0,
        ),
        Text("Laki-laki"),
      ],
    );
  }

  _textboxradio2() {
    return Row(
      children: [
        Radio(
            value: 2,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            }),
        SizedBox(
          width: 10.0,
        ),
        Text("Perempuan"),
      ],
    );
  }

  _textboxtombol() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  String nama = name.text;
                  String _alamat = alamat.text;
                  String _asal = asal.text;
                  String _tempat = tempat.text;
                  String date = dateController.text;
                  String _radio = radio.text;

                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => data_pendaftaran(
                            namadata: nama,
                            alamatdata: _alamat,
                            asaldata: _asal,
                            tempatdata: _tempat,
                            tanggal: date,
                            radio: _radio,
                          )));
                },
                child: Text("Simpan"))),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  name.clear();
                  alamat.clear();
                  asal.clear();
                  tanggal.clear();
                  tempat.clear();
                  dateController.clear();
                },
                child: Text("Cancel"))),
      ],
    );
  }
}
