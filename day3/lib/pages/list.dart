import 'package:day3/api/request.dart';
import 'package:day3/objects/track.dart';
import 'package:day3/pages/lyrics.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage(this.title, this.code, this.country);

  final String title;
  final String code;
  final String country;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<Group> listMusics;

  @override
  void initState() {
    super.initState();
    listMusics = fetchSong(widget.code, widget.country);
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.title,
        style: TextStyle(
            color: colors.onSurface, fontSize: 16, fontWeight: FontWeight.bold),
        textScaleFactor: 1,
      )),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FutureBuilder<Group>(
                future: listMusics,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      for (int i = 0; i < snapshot.data!.songs.length; i++)
                        ListTile(
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: colors.primaryContainer,
                              ),
                              Icon(
                                Icons.music_note,
                                color: colors.onPrimaryContainer,
                              )
                            ],
                          ),
                          title: Text(
                            snapshot.data!.songs[i].name,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LyricPage(
                                            widget.title,
                                            snapshot.data!.songs[i]),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Lyrics",
                                    style: TextStyle(fontSize: 12),
                                  ))
                            ],
                          ),
                        )
                    ]);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        )
      ]),
    );
  }
}
