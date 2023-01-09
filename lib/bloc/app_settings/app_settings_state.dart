import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettingState extends Equatable {
  final ThemeMode themeMode;
  final Locale? locale;

  const AppSettingState({
    this.themeMode = ThemeMode.light,
    this.locale,
  });
  @override
  List<Object?> get props => [themeMode, locale];

  AppSettingState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppSettingState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}..addAll({'themeMode': themeMode.index});
    if (locale != null) {
      result.addAll({'locale': locale?.scriptCode});
    }

    return result;
  }

  factory AppSettingState.fromMap(Map<String, dynamic> map) {
    return AppSettingState(
      themeMode: map['themeMode'] != null
          ? ThemeMode.values[map['themeMode']]
          : ThemeMode.light,
      locale: map['locale'] != null
          ? Locale.fromSubtags(scriptCode: map['locale'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSettingState.fromJson(String source) =>
      AppSettingState.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppSettingState(themeMode: $themeMode, locale: $locale)';
}
