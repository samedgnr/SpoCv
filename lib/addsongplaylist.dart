import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:music_recommendation_with_emotional_analysiss/services/database_service.dart';

class AddSong extends StatefulWidget {
  const AddSong({super.key});

  @override
  State<AddSong> createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: addSong(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('Playlist oluşturuldu!');
        } else if (snapshot.hasError) {
          return Text('Hata oluştu: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  addSong() {
    Map<String, dynamic> songData = {
      "songName": "Yokluğunda",
      "songSinger": "Leyla is Band",
      "songIcon": "example_icon_url",
      "songDuration": "04:45",
      "SongTrackId": "65lvjeOHd1ZDJKtRpB0c57",
      "songisLiked": false,
      "SongAddTime": FieldValue.serverTimestamp(),
    };
    //DatabaseService().createPlaylist("samed", "B7lZKhzqfRZYdhRnu1IAlL3fols1" , "Beğenilenler");
    DatabaseService().addSongs("X5A4n8kGKTb3xQRvAwHi", songData);
  }
}