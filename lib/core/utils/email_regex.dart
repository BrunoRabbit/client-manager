class EmailRegex {
  static emailRegex(String text) {
    final regex = RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    
    return regex.hasMatch(text);
  }
}
