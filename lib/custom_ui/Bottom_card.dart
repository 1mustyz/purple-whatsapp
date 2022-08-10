import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purple_whatsapp/custom_ui/model/contact_model.dart';

class BottomCard extends StatelessWidget {
  final String name;
  final IconData icon;
  const BottomCard({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        leading: CircleAvatar(
            backgroundColor: const Color(0XFF25D366),
            radius: 23,
            child: Icon(
              icon,
              color: Colors.white,
            )));
  }
}
