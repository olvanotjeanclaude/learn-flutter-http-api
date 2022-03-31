class User {
  User(
      {required this.name,
      required this.surname,
      this.phone,
      this.description});

  final String name;
  final String surname;
  final String? phone;
  final String? description;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"] as String,
        surname: json["surname"] as String,
        phone: json["phone"] as String,
        description: json["description"] ?? "No description");
  }
  @override
  String toString() {
    return "[name: $name, surname:$surname, phone: $phone]";
  }

  get fullName => "$name $surname";
}
