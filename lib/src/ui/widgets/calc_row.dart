import 'package:flutter/material.dart';
import '../widgets/calc_button.dart';

class CalcRow extends StatelessWidget {
  final List<Widget> rowContents;
  const CalcRow({
    Key key,
    @required this.rowContents,
  })  : assert(rowContents != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CalcButton> rowList = rowContents
        .map((content) => CalcButton(
              onPressed: () {},
              buttonWidget: content,
            ))
        .toList();
    return Expanded(
      child: Row(
        children: <Widget>[...rowList],
      ),
    );
  }
}
