import 'dart:convert';

class Student {
  String name;
  String imgUrl;
  Student({
    required this.name,
    required this.imgUrl,
  });

  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
        name: map['name']['first'], imgUrl: map['picture']['medium']);
  }

  @override
  String toString() => 'Student(name: $name, imgUrl: $imgUrl)';
}
