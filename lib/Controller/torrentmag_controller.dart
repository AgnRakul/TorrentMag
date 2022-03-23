import 'package:flutter/material.dart';
import 'package:torrentmag/Model/torrent_mag.dart';
import 'package:torrentmag/Service/apiservice.dart';

class TorrentMagController extends ChangeNotifier {
  TorrentMag torrentMag = TorrentMag();

  List<TorrentMag> torrentMagList = [];

  void getTorrentMag(String name) {
    ApiService.instance.torrentMag(name).then((value) {
      if (value.isNotEmpty) {
        torrentMagList = [...value];
        notifyListeners();
      } else {
        torrentMagList = [];
      }
    });
  }
}
