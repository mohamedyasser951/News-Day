import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Presentation/modules/loading/shimmerLoading.dart';
import 'package:newsapp/Presentation/modules/loading/skelton.dart';
import 'package:newsapp/Presentation/widgets/ArticalItem.dart';
import 'package:newsapp/Presentation/widgets/smallArticalItem.dart';
import 'package:newsapp/config/app_local.dart';

class ArticalBuilder extends StatelessWidget {
  final List list;
  bool isSearch;
  final int? index;
  ArticalBuilder(
      {super.key, required this.list, this.isSearch = false, this.index});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        // ignore: prefer_is_empty
        condition: list.length > 0,
        builder: ((
          context,
        ) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                if (list[index]["description"] != null) {
                  return BuildArticalItem(artical: list[index], index: index);
                } else {
                  return SmallArticalItem(artical: list[index], index: index);
                }
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 0,
                  )),
              itemCount: list.length);
        }),
        fallback: ((context) => isSearch
            ? Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 120.0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        getLang(context, "searchNews"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        getLang(context, "messageSearchScreen"),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              )
            : LoadingBuilder()));
  }
}

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GetShimmerLoading(
            widget: LoadingItem(),
          );
        },
      ),
    );
  }
}

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            height: 180,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Skeleton(
            height: 11.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Skeleton(
            height: 11.0,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Skeleton(
            width: MediaQuery.of(context).size.width / 2,
            height: 10.0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Skeleton(
                height: 18,
                width: 18,
              ),
              SizedBox(
                width: 4.0,
              ),
              Skeleton(
                height: 8,
                width: MediaQuery.of(context).size.width / 6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
