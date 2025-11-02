import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtentions on BuildContext{
  ColorScheme get appColors => Theme.of(this).colorScheme;
  TextTheme get fonts => Theme.of(this).textTheme;
  AppLocalizations get locals => AppLocalizations.of(this)!;
}