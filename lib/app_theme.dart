import 'package:flutter/material.dart';
import 'package:snag_application_1/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
      useMaterial3: true,
      primaryColor: AppColors.primaryBlue,
      secondaryHeaderColor: AppColors.ctaOrange,
      scaffoldBackgroundColor: Colors.white,
      extensions: <ThemeExtension<dynamic>>[
        StatusColors(
          todo: AppColors.lightTodo,
          inProgress: AppColors.lightInProgress,
          resolved: AppColors.lightResolved,
          blocked: AppColors.lightBlocked,
        )
      ]
    );
  }
}


class StatusColors extends ThemeExtension<StatusColors> {
  final Color? todo;
  final Color? inProgress;
  final Color? resolved;
  final Color? blocked;

  StatusColors({
    this.todo,
    this.inProgress,
    this.resolved,
    this.blocked,
  });

  @override
  StatusColors copyWith({
    Color? todo,
    Color? inProgress,
    Color? resolved,
    Color? blocked,
  }) {
    return StatusColors(
      todo: todo ?? this.todo,
      inProgress: inProgress ?? this.inProgress,
      resolved: resolved ?? this.resolved,
      blocked: blocked ?? this.blocked,
    );
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) {
      return this;
    }
    return StatusColors(
      todo: Color.lerp(todo, other.todo, t),
      inProgress: Color.lerp(inProgress, other.inProgress, t),
      resolved: Color.lerp(resolved, other.resolved, t),
      blocked: Color.lerp(blocked, other.blocked, t),
    );
  }
}