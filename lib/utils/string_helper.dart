import 'dart:math';

const sentenceSeparator = ' ';

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension StringExtension on String? {
  int calculatePasswordStrength() {
    int score = 0;
    final password = this;

    // Check password length
    if ((password?.length ?? 0) >= 8) {
      score += 1;
    }

    if (password == null) {
      return score;
    }

    // Check for uppercase letters
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      score += 1;
    }

    // Check for lowercase letters
    if (RegExp(r'[a-z]').hasMatch(password)) {
      score += 1;
    }

    // Check for digits
    if (RegExp(r'\d').hasMatch(password)) {
      score += 1;
    }

    // Check for special characters
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      score += 1;
    }

    return score;
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  String capitalizeSentence() {
    final words = this?.split(sentenceSeparator);
    String finalText = '';
    for (var word in words ?? <String>[]) {
      if (word.isNotEmpty) {
        finalText = finalText + sentenceSeparator + word.capitalizeWord();
      }
    }
    return finalText.trim();
  }

  String get titleForm {
    if (this?.trim().isEmpty == true || this == null) return '';
    final words = this?.split(sentenceSeparator);
    String finalText = '';
    for (var word in words ?? <String>[]) {
      if (word.isNotEmpty) {
        finalText = finalText + sentenceSeparator + word.capitalizeWord();
      }
    }
    return finalText.trim();
  }

  String get initial {
    List<String> nameParts = this?.trim().split(' ') ?? [];
    String initials = '';

    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }

    return initials;
  }

  String capitalizeWord() {
    // try {
    String firstChar = this?.isNotEmpty == true ? this!.substring(1) : '';
    return "${this?[0].toUpperCase()}${firstChar.toLowerCase()}";
    // } catch (e) {
    //   return this;
    // }
  }

  String get sentenceForm {
    if (this?.trim().isEmpty == true || this == null) return '';
    final sentences = this?.split('.');
    String returnValue = '';

    for (String sentence in sentences ?? <String>[]) {
      final trimmed = sentence.trim();
      sentence = trimmed.isEmpty ? '' : trimmed.capitalizeWord();
      if (returnValue == '') {
        returnValue = returnValue + sentence;
      } else {
        returnValue = '$returnValue. $sentence';
      }
    }

    return '$returnValue.';
  }

  String capitalizeSentences() {
    if (this?.trim().isEmpty == true || this == null) return '';
    final sentences = this?.split('.');
    String returnValue = '';

    for (String sentence in sentences ?? <String>[]) {
      final trimmed = sentence.trim();
      sentence = trimmed.isEmpty ? '' : trimmed.capitalizeWord();
      if (returnValue == '') {
        returnValue = returnValue + sentence;
      } else {
        returnValue = '$returnValue. $sentence';
      }
    }

    return '$returnValue.';
  }

  String cleanForPath() {
    String cleanedString = this ?? '';
    cleanedString = cleanedString.replaceAll(".", "");
    cleanedString = cleanedString.replaceAll("#", "");
    cleanedString = cleanedString.replaceAll("\$", "");
    cleanedString = cleanedString.replaceAll("[", "(");
    cleanedString = cleanedString.replaceAll("]", ")");
    cleanedString = cleanedString.replaceAll("&", " dan ");
    cleanedString = cleanedString.replaceAll("/", " atau ");

    return cleanedString;
  }

  bool get isNullOrEmpty => this == null || this?.trim() == '';
}

// String? cleanForPath(String? toBeCleaned) {
//   if (toBeCleaned == null) return null;

//   String cleanedString = toBeCleaned;
//   cleanedString = cleanedString.replaceAll(".", "");
//   cleanedString = cleanedString.replaceAll("#", "");
//   cleanedString = cleanedString.replaceAll("\$", "");
//   cleanedString = cleanedString.replaceAll("[", "(");
//   cleanedString = cleanedString.replaceAll("]", ")");
//   cleanedString = cleanedString.replaceAll("&", " dan ");
//   cleanedString = cleanedString.replaceAll("/", " atau ");

//   return cleanedString;
// }
