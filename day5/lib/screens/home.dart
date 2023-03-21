import 'package:day5/providers/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/search_service.dart';
import '../widgets/photo.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PhotosProvider>();
    Widget widgetShow = const Center();

    if (appState.loading == false && appState.photos.photos.isEmpty) {
      widgetShow = Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "No photo to display",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ));
    } else if (appState.loading == true) {
      widgetShow = Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const CircularProgressIndicator()]));
    } else {
      widgetShow = Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PhotosContainer(photo: appState.photos.photos[index]);
              },
              itemCount: appState.photos.photos.length,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.photo_album),
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () async {
                var word = await showSearch(
                    context: context, delegate: CustomSearch());
                if (word != null) {
                  setState(() {
                    searchQuery = word;
                  });
                  appState.setLoading();
                  appState.fetchPhotos(word);
                }
              },
              icon: const Icon(Icons.search))
        ],
        elevation: 2,
      ),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(top: 4), child: widgetShow)),
    );
  }
}
