import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purple_whatsapp/custom_ui/model/contact_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(contact.status, style: const TextStyle(fontSize: 13)),
        leading: Container(
          height: 50,
          width: 50,
          child: Stack(children: [
            CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 23,
                child: SvgPicture.asset(
                  "assets/person_black_36dp.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                )),
            contact.select
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 8,
                      ),
                    ),
                  )
                : Container()
          ]),
        ));
  }
}
