class Student {
  Student({
    required this.id,
    required this.name,
    required this.nim,
    required this.program,
    required this.semester,
    required this.gpa,
    required this.photoUrl,
    required this.accentColor,
  });

  final String id;
  String name;
  final String nim;
  final String program;
  final int semester;
  final double gpa;
  final String photoUrl;
  final int accentColor;
}
