import 'package:flutter/material.dart';
import 'package:purple_whatsapp/custom_ui/Bottom_card.dart';
import 'package:purple_whatsapp/custom_ui/contact_card.dart';
import 'package:purple_whatsapp/custom_ui/model/chart_model.dart';
import 'package:purple_whatsapp/custom_ui/model/contact_model.dart';
import 'package:purple_whatsapp/screens/create_group.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ContactModel> contact = [
    ContactModel(name: "Abdulraheem", status: "A genius"),
    ContactModel(name: "Tapaswi", status: "Dan sauro"),
    ContactModel(name: "Taju", status: "Zumudi"),
    ContactModel(name: "Nibras", status: "Baba fama")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: "Invite a friend",
                child: Text('Invite a friend'),
              ),
              PopupMenuItem(
                value: "Contacts",
                child: Text('Contacts'),
              ),
              PopupMenuItem(
                value: "Refresh",
                child: Text('Refresh'),
              ),
              PopupMenuItem(
                value: "Help",
                child: Text('Help'),
              ),
            ];
          })
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Select contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '50 contacts',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: contact.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => CreateGroupPage()));
                },
                child: const BottomCard(
                  name: "New Group",
                  icon: Icons.group,
                ),
              );
            } else if (index == 1) {
              return const BottomCard(
                  name: "New Contact", icon: Icons.person_add);
            }
            return ContactCard(contact: contact[index - 2]);
          }),
    );
  }
}
