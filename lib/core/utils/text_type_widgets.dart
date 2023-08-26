bool isNumeric(String s) {
  if (s.trim().isEmpty) {
    return false;
  }
  return double.tryParse(s) != null;
}
