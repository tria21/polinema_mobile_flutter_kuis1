import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownInput extends StatelessWidget {
  const DropdownInput({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropdownOnChangedInput,
  }) : _newValueInput = newValue, super(key: key);

  final List<String> listItem;
  final String _newValueInput;
  final Function dropdownOnChangedInput;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValueInput,
                  onChanged: dropdownOnChangedInput,//untuk auto konvert ketika mengganti value dropdown
                  );
  }
}

