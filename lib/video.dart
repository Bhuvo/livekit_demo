import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

class VideoTile extends StatelessWidget {
  final VideoTrack videoTrack;
  final bool isLocal;

  const VideoTile({required this.videoTrack, this.isLocal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      color: Colors.black,
      child: VideoTrackRenderer(
        videoTrack,
      ),
    );
  }
}
