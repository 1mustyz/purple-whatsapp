import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:purple_whatsapp/custom_ui/model/chart_model.dart';

class IndividualPage extends StatefulWidget {
  final ChartModel chatModel;
  IndividualPage({Key? key, required this.chatModel}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  FocusNode focusNode = FocusNode();
  bool show = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/groups_black_36dp.svg"
                        : "assets/person_black_36dp.svg",
                    color: Colors.white,
                    height: 37,
                    width: 37,
                  ))
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                      fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "last seen today at 3:03",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: "View contact",
                child: Text('View contact'),
              ),
              PopupMenuItem(
                value: "Media links, and docs",
                child: Text('Media links, and docs'),
              ),
              PopupMenuItem(
                value: "Whatsapp web",
                child: Text('Whatsapp web'),
              ),
              PopupMenuItem(
                value: "Starred message",
                child: Text('Starred message'),
              ),
              PopupMenuItem(
                value: "Search",
                child: Text('Search'),
              ),
              PopupMenuItem(
                value: "Mute Notification",
                child: Text('Mute Notification'),
              ),
              PopupMenuItem(
                value: "Wallpaper",
                child: Text('Wallpaper'),
              )
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              show = false;
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 65,
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          show = !show;
                                        });
                                      },
                                      icon: const Icon(Icons.emoji_emotions)),
                                  suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                            icon:
                                                const Icon(Icons.attach_file)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.camera_alt))
                                      ]),
                                  hintText: "Type a message",
                                  contentPadding: const EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 2, right: 3),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 193, 167, 230),
                            radius: 25,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                    show
                        ? Container(
                            width: 500,
                            height: MediaQuery.of(context).size.height / 3,
                            child: emojiSelect())
                        : Container()
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
      config: const Config(
        columns: 7,
      ),
    );
  }

  Widget bottomSheet() => Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: const EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreate(
                        icon: Icons.insert_drive_file,
                        color: Colors.indigo,
                        text: "Document"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(
                        icon: Icons.camera_alt,
                        color: Colors.pink,
                        text: "Camera"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(
                        icon: Icons.insert_photo,
                        color: Colors.purple,
                        text: "Gallery")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreate(
                        icon: Icons.headset,
                        color: Colors.orange,
                        text: "Audio"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(
                        icon: Icons.location_pin,
                        color: Colors.teal,
                        text: "Location"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(
                        icon: Icons.person, color: Colors.blue, text: "Contact")
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget iconCreate(
      {required IconData icon, required Color color, required String text}) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
