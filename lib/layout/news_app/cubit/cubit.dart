import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/cubit/states.dart';
import '../../../modules/business/business_screen.dart';
import '../../../modules/science/science_screen.dart';
import '../../../modules/sports/sports_screen.dart';
import '../../../network/local/cache_helper.dart';
import '../../../network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit () : super (NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
 List<BottomNavigationBarItem> bottomItems =[
   BottomNavigationBarItem(
       icon: Icon(Icons.business),
       label: 'business'),
   BottomNavigationBarItem(
       icon: Icon(Icons.sports),
       label: 'sports'),
   BottomNavigationBarItem(
       icon: Icon(Icons.science_outlined),
       label: 'science'),

 ];

 List<Widget> screens=[
   BusinessScreen(),
   SportsScreen(),
   ScienceScreen(),
 ];

 void changeBottomNavBar(index){
   currentIndex= index;
   if(index ==0)
     getBusiness();
   if(index ==1)
     getSports();
   if(index ==2)
     getScience();
   emit(NewsBottomNavState());
 }

 List<dynamic> business=[];

 void getBusiness(){
   emit(NewsGetBusinessLodingState());
   if(business.length == 0){
     DioHelper.getData(url:'v2/top-headlines',
         query:{
           'country':'us',
           'category':'business',
           'apiKey':'565f1b45f3e24efd9a43edcc9a1e6222',
         }).then((value) {
       business=value.data['articles'];
       print(business[0]['title']);
       //print(value.data.toString());
       emit(NewsGetBusinessSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetBusinessErrorState());
     });
   }else{
     emit(NewsGetBusinessSuccessState());
   }
 }


  List<dynamic> sports=[];

  void getSports(){
    emit(NewsGetSportsLodingState());
    if(sports.length == 0){
      DioHelper.getData(url:'v2/top-headlines',
          query:{
            'country':'us',
            'category':'sports',
            'apiKey':'565f1b45f3e24efd9a43edcc9a1e6222',
          }).then((value) {
        sports=value.data['articles'];
        print(sports[0]['title']);
        //print(value.data.toString());
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState());
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science=[];

  void getScience(){
    emit(NewsGetScienceErrorState());
    if(science.length == 0){
      DioHelper.getData(url: 'v2/top-headlines',
          query:{
            'country':'us',
            'category':'science',
            'apiKey':'565f1b45f3e24efd9a43edcc9a1e6222',
          }).then((value) {
        science=value.data['articles'];
        print(science[0]['title']);
        //print(value.data.toString());
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState());
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search=[];

  void getSearch(String value){

    emit(NewsGetSearchLodingState());
    DioHelper.getData(url: 'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'565f1b45f3e24efd9a43edcc9a1e6222',
        }).then((value) {
      search=value.data['articles'];
      print(search[0]['title']);
      //print(value.data.toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState());
    });
  }
  bool isDark = false;
  void changAppMode({bool? fromShared}){
    if(fromShared !=null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark =!isDark;
      CacheHelper.putBoolean(key:'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });
    }
  }


}


