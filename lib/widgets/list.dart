import 'package:first_app/model/contact.dart';
import 'package:first_app/repository/contact_repository.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  // Create class Contact
  // List of Contact

  // List<Contact> contacts = [
  //   Contact("Ali", "0123456789", "ABC Company", "abc@email.com"),
  //   Contact("Zainab", "023333333", "XYZ Company", "xyz@email.com"),
  // ];

  final contactRepo = ContactRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
            future: contactRepo.getContact(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!
                      .map((Contact contact) => Container(
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(contact.name),
                                    Text(contact.phone),
                                  ],
                                ),
                                Text(
                                  contact.company,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  contact.email,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/edit",
                                                arguments: contact)
                                            .then(
                                          (_) => contactRepo
                                              .getContact()
                                              .then((_) => setState(() {})),
                                        );
                                      },
                                      child: const Text(
                                        "EDIT",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        contactRepo.deleteContact(contact);
                                      },
                                      child: const Text(
                                        "DELETE",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate to specific named route
          Navigator.pushNamed(context, "/add").then(
              (_) => contactRepo.getContact().then((_) => setState(() {})));

          // navigation stack
          // "/",
          // "/add"
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
