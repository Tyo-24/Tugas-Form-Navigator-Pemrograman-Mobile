import 'dart:html';

import 'package:flutter/material.dart';

class data_pendaftaran extends StatefulWidget {
  final String namadata;
  final String alamatdata;
  final String asaldata;
  final String tempatdata;
  final String tanggal;
  final String radio;

  data_pendaftaran({
    required this.namadata,
    required this.alamatdata,
    required this.asaldata,
    required this.tempatdata,
    required this.tanggal,
    required this.radio,
  });

  @override
  State<data_pendaftaran> createState() => _data_pendaftaranState();
}

class _data_pendaftaranState extends State<data_pendaftaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Pendaftaran')),
      body: Column(children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text("Nama Pendaftar : " + widget.namadata),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Alamat : ${widget.alamatdata}"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Asal : ${widget.asaldata}"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Tempat Lahir : ${widget.tempatdata}"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Tanggal : ${widget.tanggal}"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Jenis Kelamin : ${widget.radio}"),
        ),
      ]),
    );
  }
}
