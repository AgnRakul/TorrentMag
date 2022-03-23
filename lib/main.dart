// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'Controller/torrentmag_controller.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<TorrentMagController>(
        create: (_) => TorrentMagController(),
        child: TorrentMagView(),
      ),
    );
  }
}

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
            decoration: InputDecoration.collapsed(
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
