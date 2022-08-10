import 'package:flutter/material.dart';
import 'package:purple_whatsapp/custom_ui/custom_card.dart';
import 'package:purple_whatsapp/custom_ui/model/chart_model.dart';
import 'package:purple_whatsapp/screens/select_contact.dart';

class ChartPage extends StatefulWidget {
  ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<ChartModel> chats = [
    ChartModel(
        name: "1mustyz",
        icon: "person_black_36dp.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hello"),
    ChartModel(
        name: "Yusuf",
        icon: "person_black_36dp.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hello am happy"),
    ChartModel(
        name: "Dev",
        icon: "person_black_36dp.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Happy Dev"),
    ChartModel(
        name: "Mubees.React",
        icon: "person_black_36dp.svg",
        isGroup: true,
        time: "4:00",
        currentMessage: "Happy Dev")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return CustomCard(
            chatModel: chats[index],
          );
        },
      ),
    );
  }
}
