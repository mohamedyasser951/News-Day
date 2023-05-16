abstract class AppNewsStates {}

class AppNewsInitialState extends AppNewsStates {}

class AppNewBottomNavBarState extends AppNewsStates {}

class AppNewsNewsSelectedItemState extends AppNewsStates {}

class AppNewsSetDesktopState extends AppNewsStates {}

class AppChangeModeState extends AppNewsStates {}
//Explore Screen

class AppNewsGetExploreLoadingState extends AppNewsStates {}

class AppNewsGetExploreSuccessState extends AppNewsStates {}

class AppNewsGetExploreErrorState extends AppNewsStates {
  final String error;

  AppNewsGetExploreErrorState(this.error);
}





//EnterTainMent Screen

class AppNewsGetEntertainmentLoadingState extends AppNewsStates {}

class AppNewsGetEntertainmentSuccessState extends AppNewsStates {}

class AppNewsGetEntertainmentErrorState extends AppNewsStates {
  final String error;

  AppNewsGetEntertainmentErrorState(this.error);
}





//Business States
class AppNewsGetBusinessSuccessState extends AppNewsStates {}

class AppNewsGetBusinessErrorState extends AppNewsStates {
  final String error;

  AppNewsGetBusinessErrorState(this.error);
}
class AppNewsGetBusinessLoadingState extends AppNewsStates {}


// Science States

class AppNewsGetScienceSuccessState extends AppNewsStates {}

class AppNewsGetScienceErrorState extends AppNewsStates {
  final String error;

  AppNewsGetScienceErrorState(this.error);
}

class AppNewsGetScienceLoadingState extends AppNewsStates {}

// Sports States

class AppNewsGetSportsSuccessState extends AppNewsStates {}

class AppNewsGetSportsErrorState extends AppNewsStates {
  final String error;

  AppNewsGetSportsErrorState(this.error);
}

class AppNewsGetSportsLoadingState extends AppNewsStates {}


//Search
class AppNewsSearchSuccessState extends AppNewsStates {}

class AppNewsSearchErrorState extends AppNewsStates {
  final String error;

  AppNewsSearchErrorState(this.error);
}
class AppNewsSearchsLoadingState extends AppNewsStates {}

//Health
class AppNewsGetHealthLoadingState extends AppNewsStates {}

class AppNewsGetHealthSuccessState extends AppNewsStates {}

class AppNewsGetHealthErrorState extends AppNewsStates {
  final String error;

  AppNewsGetHealthErrorState(this.error);
}




// HeadLines 
class AppNewsGetHeadLinesuceesState extends AppNewsStates{}
class AppNewsGetHeadLineErrorState extends AppNewsStates{}
class AppNewsGetHeadLineLoadingState extends AppNewsStates{}


//get userData
class GetUserDataSuccessState extends AppNewsStates{}
class GetUserDataErrorState extends AppNewsStates{}
class GetUserDataLoadingState extends AppNewsStates{}

//change country state

class ChangeCountryState extends AppNewsStates{}

// change language

class changeLanguageSuceessState extends AppNewsStates{}
class changeLanguageErrorState extends AppNewsStates{}

