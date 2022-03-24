import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/torrentmag_controller.dart';

class TorrentMagView extends StatefulWidget {
  const TorrentMagView({Key? key}) : super(key: key);

  @override
  State<TorrentMagView> createState() => _TorrentMagViewState();
}

class _TorrentMagViewState extends State<TorrentMagView> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      Provider.of<TorrentMagController>(context, listen: false)
          .getTorrentMag(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final torrentSeacher =
        Provider.of<TorrentMagController>(context, listen: false);
    torrentSeacher.getTorrentMag(textEditingController.text);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TorrentMag'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration.collapsed(
                hintText: "Enter Movie / Series / etc Name"),
          ),
          Consumer<TorrentMagController>(
              builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                      itemCount: torrentSeacher.torrentMagList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(torrentSeacher.torrentMagList[index].name
                              .toString()),
                          subtitle: Text(
                              '${torrentSeacher.torrentMagList[index].size} MB'),
                          trailing: Text(
                              '${torrentSeacher.torrentMagList[index].language}'),
                        );
                      },
                    ),
                  )),
        ],
      ),
    );
  }
}
