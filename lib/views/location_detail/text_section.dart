import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  TextSection(this._title, this._body);

  final String _title;
  final String _body;
  static const double _hPad = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(_hPad, 8.0, _hPad, 0.0),
            child: Text(
              _title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, _hPad),
            child: Text(
              _body,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ]);
  }
}
