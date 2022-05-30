abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLodingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class  NewsGetBusinessErrorState extends NewsStates{
  // final String error;
  // NewsGetBusinessErrorState(this.error);
}


class NewsGetSportsLodingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class  NewsGetSportsErrorState extends NewsStates{
  // final String error;
  // NewsGetSportsErrorState(this.error);
}


class NewsGetScienceLodingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class  NewsGetScienceErrorState extends NewsStates{
  // final String error;
  // NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLodingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class  NewsGetSearchErrorState extends NewsStates{
  // final String error;
  // NewsGetScienceErrorState(this.error);
}


class AppChangeBottomSheet extends NewsStates{}

class AppChangeModeState extends NewsStates{}