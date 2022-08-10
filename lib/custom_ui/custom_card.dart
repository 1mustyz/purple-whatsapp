// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:purple_whatsapp/custom_ui/model/chart_model.dart';
import 'package:purple_whatsapp/screens/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChartModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualPage(
                          chatModel: chatModel,
                        )));
          },
          child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  chatModel.isGroup
                      ? "assets/groups_black_36dp.svg"
                      : "assets/person_black_36dp.svg",
                  color: Colors.white,
                  height: 37,
                  width: 37,
                ),
              ),
              trailing: Text(chatModel.time),
              title: Text(
                chatModel.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.done_all),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(chatModel.currentMessage)
                ],
              )),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}
