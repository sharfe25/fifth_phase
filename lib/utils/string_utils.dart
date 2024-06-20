/// A utility class for performing common string manipulations.
class StringUtils {
  
  /// Capitalizes the first letter of the given [text].
  ///
  /// This method converts the first letter of the [text] to uppercase and the
  /// rest of the string to lowercase.
  ///
  /// If the [text] is empty, it returns the [text] as is.
  ///
  /// Example:
  /// ```dart
  /// String result = StringUtils.capitalize('hello');
  /// print(result); // Output: 'Hello'
  /// ```
  ///
  /// - Parameters:
  ///   - [text]: The string to be capitalized.
  ///
  /// - Returns: A new string with the first letter capitalized and the rest in lowercase.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text.substring(0, 1).toUpperCase() + text.substring(1).toLowerCase();
  }
}
