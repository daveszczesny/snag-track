import 'package:flutter/widgets.dart';
import 'package:snag_application_1/l10n/app_localizations.dart';

enum Priority {
  low,
  medium,
  high,
}

extension PriorityExtension on Priority {
  String name(BuildContext context) {
    switch(this) {
      case Priority.low:
        return AppLocalizations.of(context).translate('low');
      case Priority.medium:
        return AppLocalizations.of(context).translate('medium');
      case Priority.high:
        return AppLocalizations.of(context).translate('high');
    }
  }
}