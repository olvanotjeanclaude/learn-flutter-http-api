import 'package:flutter/material.dart';

import '../Models/album.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key, required this.futurAlbum}) : super(key: key);
  final Future<Album> futurAlbum;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Album>(
        future: futurAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
