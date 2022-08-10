// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:purple_whatsapp/custom_ui/model/contact_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 23,
                child: SvgPicture.asset(
                  "assets/person_black_36dp.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                )),
            const Positioned(
              bottom: 1,
              right: 2,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 236, 224, 224),
                radius: 11,
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 8,
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
