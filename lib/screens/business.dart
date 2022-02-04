import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/widgets/widgets.dart';

class BusinessScreen extends StatelessWidget {
  @override
  bool load = true;

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          if (state is! NewsgetbusnissLodingState) {
            load = false;
          }
          return load
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticle(list[index],context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: list.length);
        });
  }
}
