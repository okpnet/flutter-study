import 'package:dart_mixined/dart_mixined.dart' as dart_mixined;

import 'package:dart_mixined/models.dart';
import 'package:dart_mixined/selected_model.dart';

void main(List<String> arguments) {
  print('Hello world: ${dart_mixined.calculate()}!');
  final a = AModel();
  final b = BModel();
  a.state = ModelStateType.error;
  print(
    'AModel cast: ${a is SelectedModel}, BModel cast: ${b is SelectedModel}',
  );
}
