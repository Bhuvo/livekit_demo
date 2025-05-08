import 'package:demo/video.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'livekit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String roomId = '22';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveKit Room 22',
      home: HomePage(roomId: roomId),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String roomId;
  const HomePage({required this.roomId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Room? _room;
  String? _identity;
  bool _isConnecting = false;

  Future<String> _fetchToken(String identity, String roomId) async {
    final at = AccessToken(
      'APIjmPfoWgmMeAT',
      'sZMK962Yo3CdcahWzuLoqIBmmfvqRvJfT4cRM1v28Id',
      identity: identity,
    );
    at.addGrant({'room': roomId, 'roomJoin': true});
    print('${at.identity}, ${at.grants}');
    final token = await at.toJwt();
    print('Token: $token');
    return token;
    // Replace with your real backend endpoint
    final uri = Uri.parse(
        'https://YOUR_BACKEND_TOKEN_ENDPOINT?identity=$identity&room=$roomId');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch token');
    }
  }
  Future<void> requestPermissions() async {
    var statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.camera] != PermissionStatus.granted ||
        statuses[Permission.microphone] != PermissionStatus.granted) {
      throw Exception("Camera or microphone permission not granted.");
    }
  }

  // Future<void> _joinRoom(String identity) async {
  //   await requestPermissions();
  //   setState(() {
  //     _isConnecting = true;
  //   });
  //
  //   try {
  //     final token = await _fetchToken(identity, widget.roomId);
  //     final room = Room();
  //     await room.connect(
  //       'wss://coturn.focus.ind.in', // replace with your LiveKit server URL
  //       token,
  //       roomOptions: const RoomOptions(
  //         adaptiveStream: true,
  //         dynacast: true,
  //       )
  //     );
  //     final videoTrack = await LocalVideoTrack.createCameraTrack();
  //     await room.localParticipant?.setCameraEnabled(true);
  //     await room.localParticipant?.publishVideoTrack(videoTrack);
  //
  //
  //     room.addListener((){
  //       print('Room state changed');
  //       setState(() {
  //
  //       });
  //     });
  //
  //     setState(() {
  //       _room = room;
  //       _identity = identity;
  //     });
  //   } catch (e) {
  //     debugPrint('Error connecting to room: $e');
  //   }
  //
  //   setState(() {
  //     _isConnecting = false;
  //   });
  // }
  Future<void> _joinRoom(String identity) async {
    if(!kIsWeb) {
      await requestPermissions();
    }
    setState(() {
      _isConnecting = true;
    });

    try {
      final token = await _fetchToken(identity, widget.roomId);
    await Permission.camera.request();
      // Create local video track before connecting
      final videoTrack = await LocalVideoTrack.createCameraTrack();

      final room = Room();
      await room.localParticipant?.publishVideoTrack(videoTrack);
      await room.connect(
        'wss://coturn.focus.ind.in', // your LiveKit server
        token,
        roomOptions: const RoomOptions(
          adaptiveStream: true,
          dynacast: true,
        ),

      );

      await room.localParticipant?.setCameraEnabled(true);

      room.addListener(() {
        print('Room state changed');
        setState(() {});
      });

      setState(() {
        _room = room;
        _identity = identity;
      });
    } catch (e) {
      debugPrint('Error connecting to room: $e');
    }

    setState(() {
      _isConnecting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> videoTiles = [];

    if (_room != null && _room!.localParticipant!.isCameraEnabled()) {
      final track = _room!.localParticipant?.videoTrackPublications.firstOrNull?.track;
      if (track != null) {
        videoTiles.add(VideoTile(videoTrack: track, isLocal: true));
      }
    }

    _room?.remoteParticipants.forEach((_, participant) {
      for (var pubTrack in participant.videoTrackPublications) {
        if (pubTrack.subscribed && pubTrack.track != null) {
          videoTiles.add(VideoTile(videoTrack: pubTrack.track!));
        }
      }
    });

    if (_room != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Room 22 - $_identity'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Connected as $_identity\nParticipants: ${_room!.remoteParticipants.length + 1}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: videoTiles,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('LiveKit Room 22')),
      body: Center(
        child: _isConnecting
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _joinRoom('user_a'),
              child: const Text('User A - Create/Join Room'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _joinRoom('user_b'),
              child: const Text('User B - Join Room'),
            ),
          ],
        ),
      ),
    );
  }
}
