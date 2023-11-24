class DataService {
  static List<String> getLinesByName(pattern) {
    List<String> data = [
      'Ligne 1',
      'Ligne 2',
      'Ligne 3',
      'Ligne 4',
      'Ligne 5',
      'Ligne 6',
      'Ligne 7',
      'Ligne 8',
    ];
    List<String> result = [];
    for (var element in data) {
      if (element.contains(pattern)) {
        result.add(element);
      }
    }
    return result;
  }

  static List<String> getTerminalsByName(pattern) {
    List<String> data = [
      'Campus',
      'Intendance',
      'Trinité',
      'Mwana wuta',
      'Blvd Salongo',
      'Rond point Ngaba',
    ];
    List<String> result = [];
    for (var element in data) {
      if (element.contains(pattern)) {
        result.add(element);
      }
    }
    return result;
  }
}
