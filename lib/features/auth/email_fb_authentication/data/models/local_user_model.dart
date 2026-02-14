class LocalUserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String secondLastName;

  LocalUserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.secondLastName,
  });

  Map<String, dynamic> toJson() => {
    //'id': id,
    'email': email,
    'name': firstName,
    'lastName': lastName,
    'secondLastName': secondLastName,
  };

  factory LocalUserModel.fromJson(Map<String, dynamic> json) {
    return LocalUserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['name'],
      lastName: json['lastName'],
      secondLastName: json['secondLastName'],
    );
  }
}
