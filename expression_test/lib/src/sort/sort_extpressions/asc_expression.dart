import '../../constants/constants.dart';
import '../../debugs/debug.dart';
import '../sort_visitors/sort_visitors.dart';
import 'sort_expressions.dart';

abstract interface class IAscExpression implements ISortExpression {}

class AscExpression extends SortExpression implements IAscExpression {
  AscExpression({super.name});

  @override
  ExpresionCallBack accept(ISortVisitor visitor) {
    // TODO: implement accept
    throw UnimplementedError();
  }

  @override
  DebugNode acceptDebug() {
    // TODO: implement acceptDebug
    throw UnimplementedError();
  }
}
