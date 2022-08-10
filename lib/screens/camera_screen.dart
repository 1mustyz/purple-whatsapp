import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:purple_whatsapp/screens/camera_view.dart';
import 'package:purple_whatsapp/screens/video_view.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool flipCamera = false;
  double transform = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        // for camera
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        Positioned(
          bottom: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                          onTap: () {
                            if (!isRecording) {
                              takePhoto(context);
                            }
                          },
                          onLongPress: () async {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                          },
                          onLongPressUp: () async {
                            final videoFile =
                                await _cameraController.stopVideoRecording();
                            setState(() {
                              isRecording = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => VideoView(
                                          path: videoFile.path,
                                        )));
                          },
                          child: isRecording
                              ? const Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 70,
                                )
                              : const Icon(
                                  Icons.panorama_fish_eye,
                                  color: Colors.white,
                                  size: 70,
                                )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flipCamera = !flipCamera;
                              transform = transform + 180;
                            });
                            if (flipCamera) {
                              _cameraController = CameraController(
                                  cameras[1], ResolutionPreset.medium);
                              cameraValue = _cameraController.initialize();
                            } else {
                              _cameraController = CameraController(
                                  cameras[0], ResolutionPreset.medium);
                              cameraValue = _cameraController.initialize();
                            }
                          },
                          icon: Transform.rotate(
                            angle: transform,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Hold Tab for photo",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void takePhoto(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()},png");
    final image = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraView(
                  path: image.path,
                )));
  }
}
