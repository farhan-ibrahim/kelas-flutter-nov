// Handle adding contact to firestore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/contact.dart';

class ContactRepository {
  // To connect to firestore
  // Define path to collection = Contacts
  final contactsCollection = FirebaseFirestore.instance.collection("Contacts");

  Future<void> addContact(Contact contact) async {
    /// Add new contact to firestore
    /// should be in the form of Map<String, dynamic>
    await contactsCollection.add(contact.toMap());
  }

  /// get all contacts from firestore

  Future<List<Contact>> getContact() async {
    // return list of contact
    final snapshot = await contactsCollection.get();

    // doc = Map<String, dynamic>
    // convert to Contact

    // snapshot.docs = [
    // {
    //   "name": "John Doe",
    //   "phone": "0123456789",
    //   "company": "ABC Company",
    //   "email": "john@doe"
    // },

    // ]
    return snapshot.docs.map((doc) => Contact.fromSnapshot(doc)).toList();
  }

  ///
  ///
  /// delete contact from firestore
  ///
  deleteContact(Contact contact) async {
    return contactsCollection.doc(contact.id).delete();
  }

  ///
  ///
  /// update contact from firestore
  updateContact(Contact contact) {
    return contactsCollection.doc(contact.id).update(contact.toMap());
  }
}
