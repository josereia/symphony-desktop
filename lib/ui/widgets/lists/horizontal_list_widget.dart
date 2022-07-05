import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Título",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              InkWell(
                child: Text("Ver Tudo"),
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
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: const Image(
                          width: 148,
                          height: 148,
                          image: NetworkImage(
                            "https://tracklist.com.br/wp-content/uploads/2021/04/olivia-debut.jpg",
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
