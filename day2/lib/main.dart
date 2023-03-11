import 'package:day2/state/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(title: 'Contacts'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var contacts = appState.contacts;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.people),
        title: Text(title),
        centerTitle: true,
      ),
      body: (contacts.isNotEmpty)
          ? Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ListView(
                children: contacts
                    .map((e) => Column(
                          children: [_LineContact(contact: e), Divider()],
                        ))
                    .toList(),
              ),
            )
          : Center(
              child: Text('No contact yet.'),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contest) => AddContact()));
        },
        tooltip: 'New Contact',
        child: const Icon(Icons.group_add_outlined),
      ),
    );
  }
}

class _LineContact extends StatelessWidget {
  _LineContact({required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (contact.url != "")
          ? CircleAvatar(
              backgroundColor: Colors.amber,
            )
          : CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                contact.name[0],
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
      title: Text(
        contact.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact.email),
          Text(contact.number),
        ],
      ),
    );
  }
}

class AddContact extends StatefulWidget {
  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var appState = context.watch<AppState>();

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
          title: Text("New Contact"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 30),
            child: Column(children: [
              Stack(
                alignment: Alignment(0.95, 0.98),
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(
                      Icons.person,
                      size: 80,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.camera_alt,
                      size: 25,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: "Name"),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Enter a valid name";
                          }
                          return null;
                        }),
                      ),
                      TextFormField(
                          controller: mailController,
                          decoration: InputDecoration(labelText: "Email"),
                          validator: ((value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          })),
                      TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(labelText: "Phone"),
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          })),
                    ],
                  )),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            if (!isValid) return;
            appState.newContact(Contact(nameController.text,
                mailController.text, phoneController.text, ""));
            Navigator.pop(context);
          },
          tooltip: 'Save',
          child: const Icon(Icons.save),
        ));
  }
}
