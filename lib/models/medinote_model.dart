class Medinote {
  const Medinote({
    required this.id,
    required this.name,
    required this.activeFluid,
    required this.dosage,
    required this.note,
  });

  final String id;
  final String name;
  final String activeFluid;
  final String dosage;
  final String note;

  factory Medinote.fromJson(Map<String, dynamic> json) => Medinote(
        id: json['id'],
        name: json['name'],
        activeFluid: json['activeFluid'],
        dosage: json['dosage'],
        note: json['note'],
      );
}
