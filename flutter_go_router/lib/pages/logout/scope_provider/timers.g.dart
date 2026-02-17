// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customTimer)
final customTimerProvider = CustomTimerFamily._();

final class CustomTimerProvider
    extends
        $FunctionalProvider<TimerController, TimerController, TimerController>
    with $Provider<TimerController> {
  CustomTimerProvider._({
    required CustomTimerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'customTimerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customTimerHash();

  @override
  String toString() {
    return r'customTimerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TimerController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TimerController create(Ref ref) {
    final argument = this.argument as int;
    return customTimer(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimerController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimerController>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CustomTimerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customTimerHash() => r'0c3a20139ea1bf94f41f0eabe593424ba6b9236c';

final class CustomTimerFamily extends $Family
    with $FunctionalFamilyOverride<TimerController, int> {
  CustomTimerFamily._()
    : super(
        retry: null,
        name: r'customTimerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CustomTimerProvider call(int tick) =>
      CustomTimerProvider._(argument: tick, from: this);

  @override
  String toString() => r'customTimerProvider';
}
