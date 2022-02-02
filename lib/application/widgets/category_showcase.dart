import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lanai/application/screens/photo_details.dart';
import 'package:lanai/domain/models/photo_model.dart';

class CategoryShowCase extends StatelessWidget {
  const CategoryShowCase({Key? key, required this.photos}) : super(key: key);

  final List<PhotoElement> photos;

  @override
  Widget build(BuildContext context) {
    return photos.isNotEmpty
        ? GridView.custom(
            padding: const EdgeInsets.only(right: 15),
            shrinkWrap: true,
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: const [
                QuiltedGridTile(1, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoDetails(data: photos[index]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(photos[index].src.large),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              childCount: photos.length,
            ),
            physics: const NeverScrollableScrollPhysics(),
          )
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }
}
