import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistsList extends StatelessWidget {
  final String title;

  const ArtistsList({super.key, required this.title});

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
              TextButton(
                onPressed: () => {},
                child: Text("view_more".tr),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(148),
                        child: const Image(
                          width: 148,
                          height: 148,
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            "https://tracklist.com.br/wp-content/uploads/2021/04/olivia-debut.jpg",
                          ),
                        ),
                      ),
                      const SizedBox(height: 9 + 6),
                      SizedBox(
                        width: 148,
                        child: Center(
                          child: Text(
                            "Título",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
