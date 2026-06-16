import '../visitor/visitor.dart';

abstract class Expression {
  String? name;
  Expression({this.name});
  dynamic accept(IFieldVisitor visitor, dynamic left);
}
