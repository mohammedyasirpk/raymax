extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}


String capitalizeFirstLetter(String s) {
  if ( s.isEmpty) {
    return s; 
  }
  return s[0].toUpperCase() + s.substring(1); 
}