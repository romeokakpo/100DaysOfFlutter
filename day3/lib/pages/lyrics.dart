import 'package:day3/api/request.dart';
import 'package:day3/objects/track.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class LyricPage extends StatefulWidget {
  LyricPage(this.title, this.track);
  final String title;
  final Track track;

  @override
  State<LyricPage> createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> {
  late Future<String> lyrics;

  late String tocopy;
  bool copied = false;

  @override
  void initState() {
    super.initState();
    lyrics = fetchLyrics(widget.track.id);
    tocopy = "";
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                color: colors.onSurface,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            textScaleFactor: 1,
          ),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 15),
                child: IconButton(
                  tooltip: "Copy",
                  onPressed: () async {
                    var snackBar = SnackBar(content: Text('Copied !'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    await Clipboard.setData(ClipboardData(text: tocopy));
                    setState(() {
                      copied = true;
                    });
                  },
                  icon: Icon(Icons.copy),
                  color: copied ? colors.primary : colors.outline,
                ))
          ],
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: FutureBuilder<String>(
                  future: lyrics,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String lyrics = snapshot.data ?? "";

                      SchedulerBinding.instance
                          .addPostFrameCallback((_) => setState(() {
                                tocopy = lyrics;
                              }));
                      return Column(
                        children: [
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
                              widget.track.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SelectableText(lyrics),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }
}
