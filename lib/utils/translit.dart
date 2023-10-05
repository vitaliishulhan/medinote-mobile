const Map<String, String> _collTable = {
  "А": "A",
  "Б": "B",
  "В": "C",
  "Г": "D",
  "Ґ": "E",
  "Д": "F",
  "Е": "G",
  "Є": "H",
  "Ж": "I",
  "З": "J",
  "И": "K",
  "І": "L",
  "Ї": "M",
  "Й": "N",
  "К": "O",
  "Л": "P",
  "М": "Q",
  "Н": "R",
  "О": "S",
  "П": "T",
  "Р": "U",
  "С": "V",
  "Т": "W",
  "У": "X",
  "Ф": "Y",
  "Х": "Z",
  "Ц": "Za",
  "Ч": "Zb",
  "Ш": "Zc",
  "Щ": "Zd",
  "Ь": "Ze",
  "Ю": "Zf",
  "Я": "Zg",
};
String collKeys = _collTable.keys.join("");
final RegExp keysPat = RegExp(r"(cH|ch|CH|Ch|h|H)|([" + collKeys + r"])");

bool _isUpperCase(String str){
  return str.toUpperCase() == str;
}

String _collStr(String str){
  return str.replaceAllMapped(keysPat, (match){
    assert((match[1] == null) != (match[2] == null));
    if(match[1] != null) {
      // ch group = either h or ch
      String g = match[1]!;
      if (g.length == 1) {
        // h => ha, H => Ha
        return "${g}a";
      } else {
        assert(g.length == 2);
        // need to keep the case of the letters
        String subc = _isUpperCase(g[0]) ? 'H' : 'h';
        // ch => hb, Ch => Hb, CH => Hb, cH => hb
        return "${subc}b";
      }
    }
    // diacritics
    return _collTable[match[2]]!;
  });
}

int localCompare(String a, String b){
  return _collStr(a).compareTo(_collStr(b));
}