import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String path;
  const VideoView({Key? key, required this.path}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
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
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: CircleAvatar(
                radius: 33,
                backgroundColor: Colors.black,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
