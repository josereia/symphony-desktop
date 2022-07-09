import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/ui/widgets/lists/horizontal_list_widget.dart';

class AlbumsList extends HorizontalList {
  final List<SongModel> data;

  AlbumsList({super.key, required super.title, required this.data})
      : super(height: 226, itemCount: data.length > 1 ? 10 : 0);

  @override
  Widget item({required BuildContext context, required int index}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Colors.grey.withAlpha(80),
                  offset: const Offset(
                    0.0,
                    6.0,
                  ),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Colors.grey.withAlpha(60),
                  offset: const Offset(
                    0.0,
                    9.0,
                  ),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                width: 148,
                height: 148,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  data[index].albumArt,
                ),
              ),
            ),
          ),
          const SizedBox(height: 9 + 6),
          SizedBox(
            width: 148,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].album,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  data[index].artists[0],
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
