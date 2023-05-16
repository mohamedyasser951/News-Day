import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/web_view/web_view.dart';
import 'package:newsapp/utils/components/components.dart';

class SmallArticalItem extends StatelessWidget {
  dynamic artical;
  int index;

  SmallArticalItem({super.key, required this.artical, required this.index});

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
            horizontal: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            color: Theme.of(context).backgroundColor,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(0.0),
                      image: artical['urlToImage'] != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "${artical['urlToImage']}",
                              ))
                          : const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://us.123rf.com/450wm/wnaoki/wnaoki1803/wnaoki180301266/wnaoki180301266.jpg?ver=6"))),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${artical['title']}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.1),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
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
                              formattedDate,
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
