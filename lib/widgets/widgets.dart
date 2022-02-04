import 'package:flutter/material.dart';
import 'package:news/screens/webviewscreen.dart';
import 'package:news/Conponents/conponents.dart';

Widget buildArticle(artical, context) => InkWell(
      onTap: () {
        navigateTo(context, WebviewScreen(artical['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (artical['urlToImage']!=null
                      
                          ? NetworkImage('${artical['urlToImage']}')
                          : NetworkImage(
                              'https://omarimc.com/wp-content/uploads/2017/01/news-636978_960_720.jpg')
              ))),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      '${artical['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      '${artical['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(),
    );
