import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String? id;
  String name;
  String phone;
  String company;
  String email;

  // Constructor
  Contact({
    required this.name,
    required this.phone,
    required this.company,
    required this.email,
    this.id,
  });

  // Convert to Map
  // {
  //   "name": "John Doe",
  //   "phone": "0123456789",
  //   "company": "ABC Company",
  //   "email": "john@doe"
  // }
  toMap() {
    return {
      "name": name,
      "phone": phone,
      "company": company,
      "email": email,
    };
  }

  /// factory constructor
  factory Contact.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    return Contact(
      id: snapshot.id,
      name: snapshot.data()["name"],
      phone: snapshot.data()["phone"],
      company: snapshot.data()["company"],
      email: snapshot.data()["email"],
    );
  }
}
