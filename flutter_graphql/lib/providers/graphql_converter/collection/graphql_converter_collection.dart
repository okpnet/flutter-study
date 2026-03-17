import 'package:flutter_graphql/edit_models/base/iedit_model.dart';
import 'package:flutter_graphql/providers/graphql_converter/i_graphql_converter.dart';

final class GraphQLConverterCollection {
  final Map<String, IGraphQLConverter> _converters = {};

  IGraphQLConverter? getConverter<T>() {
    return _converters[T.toString()]!;
  }

  bool hasConverter<T>() {
    if (T is! IEditModel) {
      throw ArgumentError(
        'T cannot be of type IEditModel. Please use the specific converter for edit models.',
      );
    }
    return _converters.containsKey(T.toString());
  }

  void addConverter<T>(IGraphQLConverter converter) {
    _converters[T.toString()] = converter;
  }

  void removeConverter<T>() {
    _converters.remove(T.toString());
  }

  void removeAtConverter(IGraphQLConverter converter) {
    _converters.removeWhere((key, value) => value == converter);
  }

  void removeAllConverters() {
    _converters.clear();
  }
}
