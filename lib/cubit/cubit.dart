import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Network/Local/cache_helper.dart';
import 'package:news/Network/diohelper.dart';
import 'package:news/cubit/states.dart';
import 'package:news/screens/business.dart';
import 'package:news/screens/science.dart';
import 'package:news/screens/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialstate());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curntindex = 0;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Sience'),
    //  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    SienceScreen(),
    //Settingscreen()
  ];
  void changeBottomnavBar(int index) {
    curntindex = index;
    if (index == 1) {
      getsports();
    }
    if (index == 2) {
      getsience();
    }
    emit(NewsBottomnavstate());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsgetbusnissLodingState());
    if (business.length == 0) {
      DioHelper.getdat(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apikey': 'b9efc6459a404d86abaa35b9b23ac0cf',
      }).then((value) {
        business = value.data['articles'];
       
        emit(NewsgetbusnissSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsgetbusnissErrorState(e));
      });
    } else {
      emit(NewsgetbusnissSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getsports() {
    emit(NewsgetSportsLodingState());
    if (sports.length == 0) {
      DioHelper.getdat(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': 'b9efc6459a404d86abaa35b9b23ac0cf',
      }).then((value) {
        sports = value.data['articles'];
  
        emit(NewsgetSportsSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsgetsportsErrorState(e));
      });
    } else {
      emit(NewsgetSportsSuccessState());
    }
  }

  List<dynamic> sience = [];

  void getsience() {
    emit(NewsgetSienceLodingState());
    if (sience.length == 0) {
      DioHelper.getdat(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': 'b9efc6459a404d86abaa35b9b23ac0cf',
      }).then((value) {
        sience = value.data['articles'];
 
        emit(NewsgetSienceSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsgetSienceErrorState(e));
      });
    } else {
      emit(NewsgetSienceSuccessState());
    }
  }

  bool isDark = true;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppchangeThemeMode());
    } 
    else 
    {
      isDark = !isDark;
    CacheHelper.putdata(key: 'isDark', value: isDark).then((value) {
      emit(AppchangeThemeMode());
    });
    }
  }


  List<dynamic> searsh = [];

  void getSearsh(String value) {
    searsh=[];
    emit(NewsgetSearshLodingState());
    DioHelper.getdat(
      url: 'V2/everything', 
      query: {
        'q':'$value',
        'apikey':'b9efc6459a404d86abaa35b9b23ac0cf'
      }).then((value) {
        searsh = value.data['articles'];
        print(searsh[0]['title']);
        emit(NewsgetSearshSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsgetSearshErrorState(e));
      });
  }

  void cleareSearch(){
    searsh.clear();
  }
}
