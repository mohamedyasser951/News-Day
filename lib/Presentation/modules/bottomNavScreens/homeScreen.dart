import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/cubit.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/Presentation/modules/Tabs/business/business_screen.dart';
import 'package:newsapp/Presentation/modules/Tabs/entertainment.dart/entertainment_screen.dart';
import 'package:newsapp/Presentation/modules/Tabs/explore/explore_screen.dart';
import 'package:newsapp/Presentation/modules/Tabs/health/health_screen.dart';
import 'package:newsapp/Presentation/modules/Tabs/science/science_screen.dart';
import 'package:newsapp/Presentation/modules/Tabs/sports/sports_screen.dart';
import 'package:newsapp/Presentation/modules/drawer/drawer.dart';
import 'package:newsapp/Presentation/modules/search/search.dart';
import 'package:newsapp/config/app_local.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    List<Widget> tabs = [
      myTab(getLang(context, "explor")),
      myTab(getLang(context, "entertainment")),
      myTab(getLang(context, "sports")),
      myTab(getLang(context, "health")),
      myTab(getLang(context, "science")),
      myTab(getLang(context, "business")),
    ];
    return BlocConsumer<AppNewsCubit, AppNewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppNewsCubit cubit = AppNewsCubit.get(context);
        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            key: scaffoldState,
            drawer: const MyDrawer(),
            appBar: AppBar(
              
              leading: IconButton(
                icon: const Icon(EvaIcons.menu2Outline),
                onPressed: () {
                  scaffoldState.currentState?.openDrawer();
                },
              ),
               
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: primColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabs,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: const [
                  Text(
                    "News",
                  ),
                  Text(
                    "Day",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      buildGoTo(context: context, widget: SearchScreen());
                    },
                    icon: const Icon(Icons.search)),

                Material(
                  color: Theme.of(context).backgroundColor,
                  child: PopupMenuButton<int>(
                    
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text(
                              getLang(context, "country"),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            value: 2,
                          ),
                        ];
                      },
                      onSelected: (selected) => showMenu(
                            color: Theme.of(context).backgroundColor,
                            context: context,
                            position: RelativeRect.fromLTRB(25, 25.0, 0, 0),
                            items: [
                              PopupMenuItem(
                                value: 1,
                                child: Text(
                                  getLang(context, "egypt"),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text(
                                  getLang(context, "us"),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Text(
                                  getLang(context, "germany"),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              PopupMenuItem(
                                value: 4,
                                child: Text(
                                  getLang(context, "france"),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ).then((value) {
                            if (value == 1) {
                              cubit.changeCountry('eg');
                            } else if (value == 2) {
                              cubit.changeCountry("us");
                            } else if (value == 3) {
                              cubit.changeCountry("gr");
                            } else if (value == 4) {
                              cubit.changeCountry("fr");
                            }
                          })),
                ),
              ],
            ),
            body: TabBarView(children: [
              ExploreScreen(),
              const EntertainmenrScreen(),
              const SportsScreen(),
              const HealthScreen(),
              const ScienceScreen(),
              const BusinessScreen(),
            ]),
          ),
        );
      },
    );
  }
}
