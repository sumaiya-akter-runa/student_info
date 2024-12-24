class Student {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String location;

  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
  });

  // Convert Student object into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'location': location,
    };
  }

  // Create a Student object from a map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      location: map['location'],
    );
  }
}
