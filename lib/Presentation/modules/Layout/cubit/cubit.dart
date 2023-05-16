import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Domain/models/user/usermodel.dart';
import 'package:newsapp/Presentation/modules/Layout/cubit/states.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/Data/Data%20Source/local/sheredpref_helper.dart';
import 'package:newsapp/Data/Data%20Source/remote/dio_helper.dart';

class AppNewsCubit extends Cubit<AppNewsStates> {
  AppNewsCubit() : super(AppNewsInitialState());

  static AppNewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  Future<void> changeAppLang({required String locale}) async {
    await SharedHelper.saveData(key: "lang", value: locale).then((value) {
      if (value == true) {
        currentLocalApp = locale;
        emit(changeLanguageSuceessState());
      } else {
        emit(changeLanguageErrorState());
      }
    });
  }

   String Country = "us";

  void changeCountry(String val) {
    Country = val;
    SharedHelper.saveData(key: "country", value: val).then((value) async {
      getScience();
      getSports();
      getExplore();
      getHealth();
      getHeadLine();
      getEntertainment();
      getBusiness();
    });
    emit(ChangeCountryState());
  }
 

  void bottomNavChange(int index) {
    currentindex = index;
    emit(AppNewBottomNavBarState());
  }

  int selectedItemBusiness = 0;
  bool isDesktop = false;

  void selectedBusinessItem(int index) {
    selectedItemBusiness = index;
    emit(AppNewsNewsSelectedItemState());
  }

  void setDesktop(bool value) {
    isDesktop = value;
    //  emit(AppNewsSetDesktopState());
  }

  bool isDarkMode = true;

  void changeAppMode({bool? modeFromShered}) {
    if (modeFromShered != null) {
      isDarkMode = modeFromShered;
      emit(AppChangeModeState());
    } else {
      isDarkMode = !isDarkMode;
      SharedHelper.saveData(key: "isDark", value: isDarkMode).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  UserModel? userModel;

  void getUserData() async {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(Token)
        .get()
        .then((value) {
      userModel = UserModel.fromjson(value.data()!);

      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }

 

  List<dynamic> explore = [];
  void getExplore() {
    if (explore.length == 0) emit(AppNewsGetExploreLoadingState());
    DioHelper.getData(url: "v2/top-headlines", queryParameters: {
      'country': Country,
      'category': 'general',
      'apiKey': apiKey
    }).then((value) {
      explore = value.data['articles'];
    }).catchError((e) {
      print(e.toString());
      emit(AppNewsGetExploreErrorState(e.toString()));
    });
  }

  List<dynamic> entertainment = [];
  void getEntertainment() {
    if (entertainment.length == 0) emit(AppNewsGetEntertainmentLoadingState());
    DioHelper.getData(url: "v2/top-headlines", queryParameters: {
      'country': Country,
      'category': 'entertainment',
      'apiKey': apiKey
    }).then((value) {
      entertainment = value.data['articles'];
      print(entertainment);
      emit(AppNewsGetEntertainmentSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(AppNewsGetEntertainmentErrorState(e.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    if (science.length == 0) {
      emit(AppNewsGetScienceLoadingState());
      DioHelper.getData(url: "v2/top-headlines", queryParameters: {
        'country': Country,
        'category': 'science',
        'apiKey': apiKey
      }).then((value) {
        science = value.data['articles'];
        //print(science);
        emit(AppNewsGetScienceSuccessState());
      }).catchError((e) {
        // print(e.toString());
        emit(AppNewsGetScienceErrorState(e.toString()));
      });
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    if (sports.length == 0) {
      emit(AppNewsGetSportsLoadingState());
      DioHelper.getData(url: "v2/top-headlines", queryParameters: {
        'country': Country,
        'category': 'sports',
        'apiKey': apiKey
      }).then((value) {
        sports = value.data['articles'];
        emit(AppNewsGetSportsSuccessState());
      }).catchError((e) {
        emit(AppNewsGetSportsErrorState(e.toString()));
      });
    }
  }

// search
  List<dynamic> search = [];

  void getSearch(String value) {
    DioHelper.getData(
        url: "v2/everything",
        queryParameters: {'q': value, 'apiKey': apiKey}).then((value) {
      search = value.data['articles'];
      emit(AppNewsSearchSuccessState());
    }).catchError((e) {
      emit(AppNewsGetSportsErrorState(e.toString()));
    });
  }

  List<dynamic> health = [];
  void getHealth() {
    if (health.length == 0) {
      emit(AppNewsGetHealthLoadingState());
      DioHelper.getData(url: "v2/top-headlines", queryParameters: {
        'country': Country,
        'category': 'health',
        'apiKey': apiKey
      }).then((value) {
        health = value.data['articles'];
        emit(AppNewsGetHealthSuccessState());
      }).catchError((e) {
        emit(AppNewsGetHealthErrorState(e.toString()));
      });
    }
  }

  List<dynamic> headLineData = [];

  void getHeadLine() {
    DioHelper.getData(url: "v2/top-headlines", queryParameters: {
      'country': Country,
      'apiKey': apiKey,
    }).then((value) {
      headLineData = value.data["articles"];
    }).catchError((error) {
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    if (health.length == 0) emit(AppNewsGetBusinessLoadingState());
    DioHelper.getData(url: "v2/top-headlines", queryParameters: {
      'country': Country,
      'category': 'business',
      'apiKey': apiKey
    }).then((value) {
      business = value.data['articles'];
      emit(AppNewsGetBusinessSuccessState());
    }).catchError((e) {
      emit(AppNewsGetBusinessErrorState(e.toString()));
    });
  }
}
