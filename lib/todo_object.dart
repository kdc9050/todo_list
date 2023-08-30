class Todo {
  final String work1;
  final String work2;
  late bool isChecked;
  final int id;

  Todo({
    required this.id,
    required this.work1,
    required this.work2,
    required this.isChecked,
  });

  Todo copyWith({
    String? work1,
    String? work2,
    int? id,
    bool? isChecked,
  }) {
    return Todo(
      id: id ?? this.id,
      work1: work1 ?? this.work1,
      work2: work2 ?? this.work2,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
