import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/controllers/player_controller.dart';
import 'package:symphony_desktop/data/models/song_model.dart';

class SongsList extends StatelessWidget {
  final PlayerController playerController = Get.find<PlayerController>();
  final String title;
  final List<SongModel> data;

  SongsList({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              InkWell(
                child: Text("view_more".tr),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => playerController.play(data, index, title),
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image(
                          width: 148,
                          height: 148,
                          image: NetworkImage(
                            data[index].albumArt,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 148,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              data[index].artists.join(", "),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
