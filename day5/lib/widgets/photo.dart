import 'package:day5/screens/single_photo.dart';
import 'package:flutter/material.dart';

import '../models/photos.dart';

class PhotosContainer extends StatelessWidget {
  const PhotosContainer({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          //
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SinglePhoto(
                        photo: photo,
                      )));
            },
            child: Hero(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black,
                      )),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Download",
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
