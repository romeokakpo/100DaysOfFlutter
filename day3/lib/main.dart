import 'package:day3/pages/list.dart';
import 'package:day3/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/music.jpg"), context);
    var appState = context.watch<AppState>();
    return MaterialApp(
      title: 'Song Lyrics',
      theme: ThemeData(
          brightness: appState.isLight ? Brightness.light : Brightness.dark,
          useMaterial3: true,
          colorSchemeSeed: Colors.green),
      home: const MyHomePage(title: 'Song Lyrics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (150 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var isLight = appState.isLight;
    var colors = Theme.of(context).colorScheme;
    var style = Theme.of(context)
        .textTheme
        .headline5!
        .copyWith(fontWeight: FontWeight.bold);
    ImageProvider logo = AssetImage("images/music.jpg");

    return Scaffold(
        body: CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        title: _isSliverAppBarExpanded
            ? Text(
                widget.title,
                style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textScaleFactor: 1,
              )
            : null,
        expandedHeight: 150,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsetsDirectional.only(start: 10, bottom: 10),
          title: _isSliverAppBarExpanded
              ? null
              : Text(
                  widget.title,
                  style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 1,
                ),
          centerTitle: false,
          background: Image(
            image: logo,
            fit: BoxFit.cover,
          ),
        ),
        pinned: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
                iconSize: 25,
                onPressed: () {
                  appState.changeMode();
                },
                icon: isLight
                    ? Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                      )
                    : Icon(Icons.dark_mode)),
          )
        ],
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 15),
          child: Text("Lyrics of popular songs by country",
              softWrap: true, style: style),
        ),
      ),
      SliverGrid.count(
        crossAxisCount: 2,
        children: [
          GroupBlock("bj", "Benin", widget.title),
          GroupBlock("ng", "Nigeria", widget.title),
          GroupBlock("fr", "France", widget.title),
          GroupBlock("us", "USA", widget.title),
          GroupBlock("it", "Italy", widget.title),
          GroupBlock("tg", "Togo", widget.title),
          GroupBlock("ci", "Ivory Coast", widget.title),
          GroupBlock("ma", "Morocco", widget.title),
          GroupBlock("cu", "Cuba", widget.title),
          GroupBlock("cn", "China", widget.title),
        ],
      )
    ])
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class GroupBlock extends StatelessWidget {
  GroupBlock(this.code, this.country, this.widgetTitle);

  final String code;
  final String country;
  final String widgetTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(0),
          child: GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPage(widgetTitle, code, country),
                ),
              );
            }),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: CountryFlags.flag(code)),
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 18,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    Expanded(
                      child: Container(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(country),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
