///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJp implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJp({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.jp,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <jp>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJp _root = this; // ignore: unused_field

	@override 
	TranslationsJp $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJp(meta: meta ?? this.$meta);

	// Translations
	@override String get greeting => 'こんにちは!';
	@override String get welcomeMessage => '私たちのアプリケーションへようこそ';
	@override late final _TranslationsSettingsJp settings = _TranslationsSettingsJp._(_root);
}

// Path: settings
class _TranslationsSettingsJp implements TranslationsSettingsEn {
	_TranslationsSettingsJp._(this._root);

	final TranslationsJp _root; // ignore: unused_field

	// Translations
	@override String get language => '言語';
	@override String get theme => 'テーマ';
	@override String get notification => '通知';
}

/// The flat map containing all translations for locale <jp>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJp {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		return switch (path) {
			'greeting' => 'こんにちは!',
			'welcomeMessage' => '私たちのアプリケーションへようこそ',
			'settings.language' => '言語',
			'settings.theme' => 'テーマ',
			'settings.notification' => '通知',
			_ => null,
		};
	}
}

