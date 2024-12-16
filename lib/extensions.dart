extension on String {
  bool get isPalindrom {
    String cleaned = this.replaceAll(RegExp(r'[^a-zA-Z0-9^]'), '');
    return cleaned == cleaned.split('').reversed.join();
  }
}

extension on int {
  bool get isPrime {
    if (this <= 1) return false;
    if (this == 2 || this == 3) return true;
    for (var i = 5; i * i <= this; i += 6) {
      if (this % i == 0 || this % (i + 2) == 0) return false;
    }
    return true;
  }
}

extension on DateTime {
  int daysBetween(DateTime dateTime) {
    return this.difference(dateTime).inDays.abs();
  }
}

extension on bool {
  bool and(bool other) => this && other;
  bool or(bool other) => this || other;
  bool xor(bool other) => this != other;
  bool iff(bool other) => this == other;
  bool implies(bool other) => !this || other;
}

extension on Set<String> {
  void eleminateDuplicates() {
    print("Unique keys : ${this}");
  }
}

extension on Map<String, String> {
  Map<String, List<String>> organizeBySurname() {
    Map<String, List<String>> families = {};

    forEach((individual, surname) {
      families.putIfAbsent(surname, () => []).add(individual);
    });

    return families;
  }
}
