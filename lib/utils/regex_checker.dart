class CheckRegex {
  static isEmail(String textInput) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textInput);
  }

  static isPassword(String textInput) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(textInput);
  }

  static isPhoneNumber(String textInput) {
    return RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(textInput);
  }
}
