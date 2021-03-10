import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'riwayat.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//membuat controller
  TextEditingController etInput = new TextEditingController();

//mendeklarasikan variabel yang digunakan di dalam aplikasi
  double _inputUser = 0;
  double _buah = 0;
  double _lusin = 0;
  double _kodi = 0;
  double _gross = 0;
  double _rim = 0;
  double _result = 0;

  final inputController = TextEditingController();
  var listItem = [
    "Buah",
    "Lusin",
    "Kodi",
    "Gross",
    "Rim"
  ]; //membuat listitem untuk pilihan pada dropdown

  List<String> listViewItem =
      []; //listViewItem digunakan untuk membuat item dari list riwayat

  //membuat value awal yang ditampilkan pada dropdown
  String _newValueInput = "Buah";
  String _newValueResult = "Buah";

  void perhitungan() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValueInput == "Buah") {
        if (_newValueResult == "Lusin")
          _result = _inputUser / 12;
        else if (_newValueResult == "Kodi")
          _result = _inputUser / 20;
        else if (_newValueResult == "Gross")
          _result = _inputUser / 144;
        else if (_newValueResult == "Rim")
          _result = _inputUser / 500;
        else
          _result = _inputUser;
      } else if (_newValueInput == "Lusin") {
        if (_newValueResult == "Buah")
          _result = _inputUser * 12;
        else if (_newValueResult == "Kodi")
          _result = (_inputUser * 12) / 20;
        else if (_newValueResult == "Gross")
          _result = (_inputUser * 12) / 144;
        else if (_newValueResult == "Rim")
          _result = (_inputUser * 12) / 500;
        else
          _result = _inputUser;
      } else if (_newValueInput == "Kodi") {
        if (_newValueResult == "Buah")
          _result = _inputUser * 20;
        else if (_newValueResult == "Lusin")
          _result = (_inputUser * 20) / 12;
        else if (_newValueResult == "Gross")
          _result = (_inputUser * 20) / 144;
        else if (_newValueResult == "Rim")
          _result = (_inputUser * 20) / 500;
        else
          _result = _inputUser;
      } else if (_newValueInput == "Gross") {
        if (_newValueResult == "Buah")
          _result = _inputUser * 144;
        else if (_newValueResult == "Lusin")
          _result = (_inputUser * 144) / 12;
        else if (_newValueResult == "Kodi")
          _result = (_inputUser * 144) / 20;
        else if (_newValueResult == "Rim")
          _result = (_inputUser * 144) / 500;
        else
          _result = _inputUser;
      } else {
        if (_newValueResult == "Buah")
          _result = _inputUser * 500;
        else if (_newValueResult == "Lusin")
          _result = (_inputUser * 500) / 12;
        else if (_newValueResult == "Kodi")
          _result = (_inputUser * 500) / 20;
        else if (_newValueResult == "Gross")
          _result = (_inputUser * 500) / 144;
        else
          _result = _inputUser;
      }
      //menampilkan riwayat konversi
      listViewItem.add("$_newValueInput : $_result $_newValueResult");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Konversi Kuantitas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber[900],
            leading: new Icon(Icons.home),
            title: Text("Konverter Kuantitas"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //membuat input
                TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: etInput,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Masukkan Jumlah Yang Akan Dikonversi'),
                ),
                DropdownButton(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValueInput,
                  onChanged: (String changeValue) {
                    setState(() {
                      _newValueInput = changeValue;
                      perhitungan(); //untuk auto konvert ketika mengganti value dropdown
                    });
                  },
                ),
                //membuat result
                Text(
                  "$_result",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                DropdownButton<String>(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValueResult,
                  onChanged: (String changeValue) {
                    setState(() {
                      _newValueResult = changeValue;
                      perhitungan(); //untuk auto konvert ketika mengganti value dropdown
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        perhitungan();
                      });
                    },
                    color: Colors.amber[600],
                    textColor: Colors.white,
                    child: const Text('KONVERSI'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Riwayat Konversi",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                  ),
                  ),
                  Expanded(
                    child: Riwayat(listViewItem: listViewItem)
                  ),
              ],
            ),
          )
        ),
    );
  }
}
