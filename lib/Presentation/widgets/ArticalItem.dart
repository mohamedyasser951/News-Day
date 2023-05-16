import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/widgets/loading/skelton.dart';
import 'package:newsapp/Presentation/modules/web_view/web_view.dart';
import 'package:newsapp/utils/components/components.dart';

class BuildArticalItem extends StatelessWidget {
  final dynamic artical;
  final int index;

  BuildArticalItem({super.key, required this.artical, required this.index});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(artical["publishedAt"]);
    String formattedDate = DateFormat('d MMM, h:mm a').format(date);

    return Container(
      color: AppNewsCubit.get(context).selectedItemBusiness == index &&
              AppNewsCubit.get(context).isDesktop
          ? Colors.grey[200]
          : null,
      child: InkWell(
        onTap: () {
          // if (Platform.isAndroid)
          buildGoTo(context: context, widget: WebViewScreen(artical['url']));
          AppNewsCubit.get(context).selectedBusinessItem(index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          child: Card(
            elevation: 4.0,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  child: CachedNetworkImage(
                    imageUrl: artical['urlToImage'] != null
                        ? artical['urlToImage']
                        : "https://www.euractiv.com/wp-content/uploads/sites/2/2022/05/shutterstock_1935009710-scaled.jpg",
                    placeholder: (context, url) => Center(
                        child: Skeleton(
                      height: 180,
                      width: double.infinity,
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Text(
                          "${artical['title']}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${artical['description']}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontWeight: FontWeight.normal, height: 1.25),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "$formattedDate",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
