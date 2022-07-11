import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/ui/widgets/lists/horizontal_list_widget.dart';

class ArtistsList extends HorizontalList {
  final List<SongModel> data;

  ArtistsList({super.key, required super.title, required this.data})
      : super(itemCount: data.length > 1 ? 10 : 0);

  @override
  Widget item({required BuildContext context, required int index}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(148),
            child: Image(
              width: 148,
              height: 148,
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                data[index].albumArt,
              ),
            ),
          ),
          const SizedBox(height: 9 + 6),
          SizedBox(
            width: 148,
            child: Center(
              child: Text(
                data[index].artists[0],
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void seeMoreAction() {
    Get.toNamed("/seeMore", arguments: [title, data, item]);
  }
}
