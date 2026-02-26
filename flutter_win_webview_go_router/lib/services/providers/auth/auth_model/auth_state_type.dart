import 'package:dart_mappable/dart_mappable.dart';

part 'auth_state_type.mapper.dart';

@MappableEnum()
enum AuthStateType { authenticated, expired, signedOut, fail }
