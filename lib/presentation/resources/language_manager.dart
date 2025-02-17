enum LanguageType { english, romanian }

const String english = "en";
const String romanian = "ro";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.romanian:
        return romanian;
    }
  }
}