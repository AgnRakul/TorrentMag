// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:fancy_text_reveal/fancy_text_reveal.dart';
import '../Controller/torrentmag_controller.dart';

class TorrentMagView extends StatefulWidget {
  const TorrentMagView({Key? key}) : super(key: key);

  @override
  State<TorrentMagView> createState() => _TorrentMagViewState();
}

class _TorrentMagViewState extends State<TorrentMagView> {
  late TextEditingController textEditingController;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      Provider.of<TorrentMagController>(context, listen: false)
          .getTorrentMag(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final torrentSeacher =
        Provider.of<TorrentMagController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.020),
              child: FancyTextReveal(
                child: Text(
                  "TORRENT MAG",
                  style: TextStyle(
                      fontSize: MediaQuery.textScaleFactorOf(context) * 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).padding.bottom * 0.020),
              child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                      color: Color.fromARGB(255, 197, 197, 204),
                    ),
                    hintText: "Search Movie ,Series, etc..",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 195, 196, 197),
                      fontSize: MediaQuery.textScaleFactorOf(context) * 13,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 235, 235, 235),
                  ),
                  onChanged: (value) => torrentSeacher.torrentMagList.clear(),
                  onSubmitted: (value) {
                    torrentSeacher.getTorrentMag(value);
                  }),
            ),
            Consumer<TorrentMagController>(
              builder: (context, value, child) => Expanded(
                child: value.torrentMagList.isEmpty
                    ? Center(
                        child:
                            Text("Enter Movie, Series , Games in Search Field"),
                      )
                    : ListView.builder(
                        itemCount: torrentSeacher.torrentMagList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(12),
                            child: Container(
                              width: double.infinity,
                              height:
                                  MediaQuery.of(context).size.height * 0.230,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 2.5,
                                    color: Color(0xFFF4F4F4),
                                    offset: Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/noImageIcon.png",
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.004,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.torrentMagList[index].name
                                                .toString(),
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuery.textScaleFactorOf(
                                                          context) *
                                                      7,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.020,
                                          ),
                                          IntrinsicHeight(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Leechers: ${value.torrentMagList[index].leechers}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery
                                                                .textScaleFactorOf(
                                                                    context) *
                                                            13,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                VerticalDivider(
                                                  thickness: 1,
                                                  color: Colors.black,
                                                ),
                                                Text(
                                                    "Seeders: ${value.torrentMagList[index].seeders}",
                                                    style: TextStyle(
                                                        fontSize: MediaQuery
                                                                .textScaleFactorOf(
                                                                    context) *
                                                            13,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    indent: 20,
                                    endIndent: 20,
                                    color: Colors.black,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                              "${value.torrentMagList[index].type}",
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                          .textScaleFactorOf(
                                                              context) *
                                                      12,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.006,
                                          ),
                                          Text(
                                            "Quality",
                                            style: TextStyle(
                                                fontSize: MediaQuery
                                                        .textScaleFactorOf(
                                                            context) *
                                                    14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              "${value.torrentMagList[index].size}",
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                          .textScaleFactorOf(
                                                              context) *
                                                      12,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.006,
                                          ),
                                          Text("Size",
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                          .textScaleFactorOf(
                                                              context) *
                                                      14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              "${value.torrentMagList[index].language}",
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                          .textScaleFactorOf(
                                                              context) *
                                                      12,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.006,
                                          ),
                                          Text("Language",
                                              style: TextStyle(
                                                  fontSize: MediaQuery
                                                          .textScaleFactorOf(
                                                              context) *
                                                      14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.006,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color(0xFF4D96FF), // background
                                          onPrimary: Colors.white, // foreground
                                          fixedSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.500,
                                            MediaQuery.of(context).size.height *
                                                0.048,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/download.svg"),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.006,
                                            ),
                                            Text("Download Torrent")
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color(0xFF6BCB77), // background
                                          onPrimary: Colors.white, // foreground
                                          fixedSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.400,
                                            MediaQuery.of(context).size.height *
                                                0.048,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () => {
                                          Clipboard.setData(ClipboardData(
                                                  text: value
                                                      .torrentMagList[index]
                                                      .magnet))
                                              .then((value) {
                                            final snackBar = SnackBar(
                                              content: Text(
                                                  'Magnet Link Copied to Clipboard'),
                                            ); //only if ->
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          })
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/magnet.svg"),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.006,
                                            ),
                                            Text("Magnet")
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
