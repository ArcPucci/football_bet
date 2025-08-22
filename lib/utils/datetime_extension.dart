import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get shortDate => DateFormat('dd.MM.YYYY').format(this);
}