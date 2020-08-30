import 'dart:math' show sqrt;

import 'enums.dart';
import 'exceptions.dart';
import 'package:flutter/material.dart';

class Tools {
  static bool isTablet(Size size) {
    final diagonal = sqrt(
      (size.width * size.width) + (size.height * size.height),
    );
    return diagonal > 1100.0;
  }

  static bool isLoading(LoadingState loadingState) =>
      loadingState == LoadingState.loadingInitial ||
      loadingState == LoadingState.loading ||
      loadingState == LoadingState.loadingMore;

  static String formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  static bool isNullOrEmpty(String s) => s == null || s.isEmpty;

  static void displayApiError(BuildContext context, dynamic e) {
    final msg = e is ApiException
        ? e.message
        : 'Something went wrong, please try again';
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }
}
