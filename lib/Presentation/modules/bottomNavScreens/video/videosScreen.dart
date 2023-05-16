import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/Domain/models/videoModel.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/modules/bottomNavScreens/video/videoDetail.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/Presentation/widgets/ArticaleBuilder.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  DatabaseReference? _videoref;
  @override
  void initState() {
    final dataBase = FirebaseDatabase.instance.ref();
    _videoref = dataBase.child("video");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(getLang(context, "video")),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: FirebaseAnimatedList(
            query: _videoref!,
            defaultChild: LoadingBuilder(),
            itemBuilder: (context, snapshot, animation, index) {
              VideoModel model =
                  VideoModel.fromJson(json.decode(json.encode(snapshot.value)));

              return VideoArticalItem(model: model);
            },
          ),
        ),
      ),
    );
  }
}

class VideoArticalItem extends StatelessWidget {
  const VideoArticalItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final VideoModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildGoTo(
            context: context,
            widget:
                VideoDetails(model.title!, model.media!, model.description!));
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(model.thumpnail!))),
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: 55,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 115.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${model.title}",
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
                        "${model.description}",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.normal, height: 1.25),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15.0,
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
                            "12:00 pm",
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
    );
  }
}
