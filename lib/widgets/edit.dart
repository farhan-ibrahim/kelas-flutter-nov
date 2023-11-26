import 'package:first_app/model/contact.dart';
import 'package:first_app/repository/contact_repository.dart';
import 'package:flutter/material.dart';

class EditWidget extends StatefulWidget {
  final Contact contact;
  const EditWidget({super.key, required this.contact});

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  final contactRepo = ContactRepository();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.contact.name);
    TextEditingController phoneController =
        TextEditingController(text: widget.contact.phone);
    TextEditingController companyController =
        TextEditingController(text: widget.contact.company);
    TextEditingController emailController =
        TextEditingController(text: widget.contact.email);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit contact"),
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text("Phone"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: companyController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  label: Text("Company"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    // check if email is contain "@"

                    // if (true)
                    // if (false)
                    // if (null)
                    print(value);
                    if (value != null && value.contains("@")) {
                      return "Email is not valid";
                    }
                    return null;
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  contactRepo
                      .updateContact(Contact(
                        id: widget.contact.id,
                        name: nameController.text,
                        phone: phoneController.text,
                        company: companyController.text,
                        email: emailController.text,
                      ))
                      .then((_) => Navigator.pop(context));
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
