String? inputValidator(String? value, String errorMessage) {
  if (value!.isEmpty) {
    return errorMessage;
  }

  return null;
}
