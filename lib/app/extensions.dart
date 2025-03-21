import 'package:easy_localization/easy_localization.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';

const empty = "";
const zero = 0;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return zero;
    } else {
      return this!;
    }
  }
}

extension FormattedTimestamp on String {
  String toFormattedTimestamp() {
    DateTime parsed;
    try {
      parsed = DateTime.parse(this).toLocal();
    } catch (e) {
      return this;
    }

    final now = DateTime.now();
    final diff = now.difference(parsed);

    if (diff.inSeconds < 60) {
      return AppStrings.now.tr();
    } else if (diff.inSeconds < 120) {
      return AppStrings.oneMinute.tr();
    } else if (diff.inMinutes < 60) {
      return tr(AppStrings.minutes, args: ['${diff.inMinutes}']);
    } else if (diff.inHours < 8) {
      return diff.inHours == 1
          ? AppStrings.oneHour.tr()
          : tr(AppStrings.hours, args: ['${diff.inHours}']);
    } else {
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));
      final dateOnly = DateTime(parsed.year, parsed.month, parsed.day);

      if (dateOnly == today) {
        return AppStrings.today.tr();
      } else if (dateOnly == yesterday) {
        return AppStrings.yesterday.tr();
      } else if (now.difference(dateOnly).inDays < 5) {
        return tr(
          AppStrings.daysAgo,
          args: ['${now.difference(dateOnly).inDays}'],
        );
      } else {
        if (parsed.year == now.year) {
          return DateFormat('dd MMMM').format(parsed);
        } else {
          return DateFormat('dd MMM yyyy').format(parsed);
        }
      }
    }
  }
}
