import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/widgets/loading/shimmerLoading.dart';
import 'package:newsapp/Presentation/widgets/loading/skelton.dart';
import 'package:newsapp/Presentation/modules/web_view/web_view.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/app_colors.dart';
import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<AppNewsCubit, AppNewsStates>(
          builder: ((context, state) {
        var list = AppNewsCubit.get(context).explore;
        var headList = AppNewsCubit.get(context).headLineData;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSlider(
                  carouselController: carouselController, headList: headList),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    Container(
                      color: primColor,
                      width: 4,
                      height: 20,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(getLang(context, "populornews"),
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ArticalBuilder(list: list),
            ],
          ),
        );
      }));
    });
  }
}

class HeaderSlider extends StatelessWidget {
  const HeaderSlider({
    Key? key,
    required this.carouselController,
    required this.headList,
  }) : super(key: key);

  final CarouselController carouselController;
  final List headList;

  @override
  Widget build(BuildContext context) {
    return headList.length > 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SizedBox(
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayCurve: Curves.fastOutSlowIn),
                    carouselController: carouselController,
                    items: List.generate(
                      headList.length,
                      (index) {
                        DateTime date =
                            DateTime.parse(headList[index]["publishedAt"]);
                        String formattedDate =
                            DateFormat('d MMM, h:mm a').format(date);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: InkWell(
                            onTap: () {
                              buildGoTo(
                                  context: context,
                                  widget:
                                      WebViewScreen(headList[index]["url"]));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                clipBehavior: Clip.antiAlias,
                                children: [
                                  ClipRRect(
                                    clipBehavior:Clip.antiAlias ,
                                    child: CachedNetworkImage(
                                      imageUrl: headList[index]['urlToImage'] !=
                                              null
                                          ? headList[index]['urlToImage']
                                          : "https://us.123rf.com/450wm/wnaoki/wnaoki1803/wnaoki180301266/wnaoki180301266.jpg?ver=6",
                                      placeholder: (context, url) => Center(
                                          child: Skeleton(
                                        height: 180,
                                        width: double.infinity,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    height: 90,
                                    color: Colors.black45.withOpacity(0.5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${headList[index]['title']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  height: 1.1,
                                                  color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                              formattedDate,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ))),
          )
        : GetShimmerLoading(widget: HeaderLoading());
  }
}

class HeaderLoading extends StatelessWidget {
  const HeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          width: 6.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Skeleton(
          height: 200,
          width: MediaQuery.of(context).size.width - 18,
        ),
      ),
    );
  }
}
