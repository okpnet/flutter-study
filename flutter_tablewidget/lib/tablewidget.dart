import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 1, Col 1')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 1, Col 2')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 1, Col 3')),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 2, Col 1')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 2, Col 2')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 2, Col 3')),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 3, Col 1')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 3, Col 2')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Row 3, Col 3')),
          ],
        ),
      ],
    );
  }
}
