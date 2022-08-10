import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  final String path;
  const CameraView({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.crop_rotate,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.title,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 27,
            ))
      ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - 150,
            width: MediaQuery.of(context).size.width,
            child: Image.file(fit: BoxFit.cover, File(path)),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black38,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add caption...",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        child: Icon(Icons.check),
                      ),
                      hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
