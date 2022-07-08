import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumsList extends StatelessWidget {
  final String title;

  const AlbumsList({super.key, required this.title});

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
            height: 210,
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
                          child: const Image(
                            width: 148,
                            height: 148,
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              "https://tracklist.com.br/wp-content/uploads/2021/04/olivia-debut.jpg",
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
                              "Título",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Text(
                              "Artista",
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
