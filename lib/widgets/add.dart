import 'package:first_app/model/contact.dart';
import 'package:first_app/repository/contact_repository.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key});

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final contactRepo = ContactRepository();
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: "");

  void onAddContact() async {
    // Add this to make sure the form is validated
    if (_formKey.currentState!.validate()) {
      print("Validated");
      // Get info from the text field
      // use method from contact_repository to add to Firestore

      await contactRepo
          .addContact(Contact(
            name: nameController.text,
            phone: phoneController.text,
            company: companyController.text,
            email: emailController.text,
          ))
          .then((_) => Navigator.pop(context));
    }
    // Navigation stack

    // ["/", "/add", "/"]

    // after adding new data complete, navigate back to the list.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new contact"),
        backgroundColor: Colors.teal[500],
      ),

      /// Wrap with form and add form key to validate
      body: Form(
        key: _formKey,
        child: Container(
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
                      if (value != null && !value.contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    }),
                const Spacer(),
                ElevatedButton(
                  onPressed: onAddContact,
                  child: const Text("Add Contact"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
