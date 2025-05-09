import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;

class VideoTile extends StatelessWidget {
  final VideoTrack videoTrack;
  final bool isLocal;
  final String? identity;

  const VideoTile({required this.videoTrack, this.isLocal = false, this.identity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: VideoTrackRenderer(
              fit: rtc.RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              videoTrack,
            ),
          ),
          Text(
            isLocal ? 'You' : '${identity}',style: TextStyle(color: Colors.white,fontSize: 16 ,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
