import 'package:flutter/material.dart';
import 'package:purple_whatsapp/custom_ui/Avatar_card.dart';
import 'package:purple_whatsapp/custom_ui/contact_card.dart';
import 'package:purple_whatsapp/custom_ui/model/contact_model.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  List<ContactModel> contact = [
    ContactModel(name: "Abdulraheem", status: "A genius"),
    ContactModel(name: "Tapaswi", status: "Dan sauro"),
    ContactModel(name: "Taju", status: "Zumudi"),
    ContactModel(name: "Nibras", status: "Baba fama")
  ];

  List<ContactModel> groups = [];
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
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "New Group",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add participant',
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contact.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(height: groups.isNotEmpty ? 90 : 10);
                }
                return InkWell(
                    onTap: () {
                      if (contact[index - 1].select == false) {
                        setState(() {
                          contact[index - 1].select = true;
                          groups.add(contact[index - 1]);
                        });
                      } else {
                        setState(() {
                          contact[index - 1].select = false;
                          groups.remove(contact[index - 1]);
                        });
                      }
                    },
                    child: ContactCard(contact: contact[index - 1]));
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contact.length,
                          itemBuilder: (context, index) {
                            if (contact[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  if (contact[index].select == true) {
                                    setState(() {
                                      contact[index].select = false;
                                      groups.remove(contact[index]);
                                    });
                                  }
                                },
                                child: AvatarCard(
                                  contact: contact[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
