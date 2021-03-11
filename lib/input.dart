import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
 const Input({
    Key key,
    @required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: etInput,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Masukkan Jumlah Yang Akan Dikonversi'),
                );
  }
}

