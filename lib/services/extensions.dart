extension CapExtension on String? {
  bool get isValid => this != null && this!.isNotEmpty;
}

extension Validation on String {
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isPasswordPattern {
    if (length < 8) {
      return false;
    }

    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
  }
}
