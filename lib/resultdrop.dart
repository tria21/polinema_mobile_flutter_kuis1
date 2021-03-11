import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownResult extends StatelessWidget {
  const DropdownResult({
    Key key,
    @required this.listItem,
    @required String newValue,
    @required this.dropdownOnChangedResult,
  })  : _newValueResult = newValue,
        super(key: key);

  final List<String> listItem;
  final String _newValueResult;
  final Function dropdownOnChangedResult;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValueResult,
      /*mengisi onChanged dengan function dropdownOnChangedResult yg terdapat pada main.dart*/
      onChanged: dropdownOnChangedResult,
    );
  }
}
