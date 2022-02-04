import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Conponents/conponents.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/widgets/widgets.dart';

class SearcshScreen extends StatelessWidget {
  var searsh = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).searsh;
        return Scaffold(
          appBar: AppBar( ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFiled(
                  style:  NewsCubit.get(context).isDark ? Colors.white:Colors.black,
                    onChange: (String value) {
                    
                      if(value.isEmpty){
                        NewsCubit.get(context).cleareSearch();
                        searsh.clear();
                      }
                      else{
                      NewsCubit.get(context).cleareSearch();                      
                      NewsCubit.get(context).getSearsh(value);
                      }
                    },
                    controller: searsh,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    lable: 'Search',
                    prefixIcon: Icons.search),
              ),
              Expanded(
                  child: list.isEmpty
                      ? Center(
                          child: Text(
                            'Not Foud',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      : ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildArticle(list[index], context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: list.length))
            ],
          ),
          //body: Center(child: Text('gasser')),
        );
      },
    );
  }
}
