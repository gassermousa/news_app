import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Conponents/conponents.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/screens/searsh.dart';


class Homepage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, sate) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearcshScreen());
                  cubit.cleareSearch();
                },
              ),
              IconButton(onPressed: () {
                NewsCubit.get(context).changeAppMode();
                print(NewsCubit.get(context).isDark.toString());
              }, icon:Icon( Icons.brightness_4_outlined))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitems,
            currentIndex: cubit.curntindex,
            onTap: (index) {
              cubit.changeBottomnavBar(index);
            },
          ),
          body: cubit.screens[cubit.curntindex],
        );
      },
    );
  }
}
