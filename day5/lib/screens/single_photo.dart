import 'package:day5/models/photos.dart';
import 'package:flutter/material.dart';

class SinglePhoto extends StatelessWidget {
  const SinglePhoto({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
          )
        ],
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(photo.profile),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    photo.username,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Hero(
              tag: photo.small,
              child: Image.network(photo.small, fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child:
                          Column(children: [const CircularProgressIndicator()]),
                    ));
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  Text(photo.description == "" ? "---" : photo.description),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Downloads",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Text("--")
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Likes",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text("${photo.likes}")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
