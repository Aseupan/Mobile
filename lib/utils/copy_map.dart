Map<String, T> copyMap<T>(Map<String, T> inputMap) {
  Map<String, T> copiedMap = Map<String, T>.from(inputMap);
  return copiedMap;
}
