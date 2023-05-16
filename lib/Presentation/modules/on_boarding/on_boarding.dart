import 'package:flutter/material.dart';
import 'package:newsapp/Presentation/modules/Authentication/login/social_login.dart';
import 'package:newsapp/utils/components/components.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/utils/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnBoardingModel(this.image, this.title, this.subTitle);
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boardingData = [
    OnBoardingModel("assets/images/bord0.png", "Explore Lattest News",
        "Explore lattest news and events \n happening in the world in mintes... "),
    OnBoardingModel("assets/images/bord1.png", "Get Notified First",
        "Subscripe and get notified to all of our \n articals & share with your friends..."),
    OnBoardingModel("assets/images/bord2.png", "Save Articales",
        "Bookmark your Favorite articales \n and share on social media...")
  ];
  PageController pageController = PageController();
  bool isLast = false;

  void submitStateOfOnBoarding() async {
    SharedHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value) {
        naviagetAndKill(context: context, widget: SocialLogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      submitStateOfOnBoarding();
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: primColor),
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                child: PageView.builder(
                    onPageChanged: (value) {
                      if (value == boardingData.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    controller: pageController,
                    itemBuilder: ((context, index) =>
                        buildOnBoardingItem(model: boardingData[index]))),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: boardingData.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: primColor,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        spacing: 4.0,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (isLast) {
                          submitStateOfOnBoarding();
                        } else {
                          pageController.nextPage(
                              duration: const Duration(microseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Text(
                        "next",
                        style: TextStyle(color: primColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildOnBoardingItem extends StatelessWidget {
  OnBoardingModel model;
  buildOnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Image(
          image: AssetImage(
            model.image,
          ),
          width: 300,
          height: 230,
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(model.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 2,
          width: 100,
          color: primColor,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          child: Text(
            model.subTitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 16),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
