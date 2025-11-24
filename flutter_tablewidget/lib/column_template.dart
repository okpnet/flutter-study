import 'package:flutter/widgets.dart';

class ColumnTemplate extends StatefulWidget {
  final Widget _result;
  ColumnTemplate.fromString(String value, {super.key}) : _result = Text(value);
  const ColumnTemplate(Widget result, {super.key}) : _result = result;

  @override
  State<ColumnTemplate> createState() => _ColumnTemplateState();
}

class _ColumnTemplateState extends State<ColumnTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Column Item 1'),
        Text('Column Item 2'),
        Text('Column Item 3'),
      ],
    );
  }
}
