import 'package:flutter/material.dart';
import 'package:news/cubit/cubit.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defaultFormFiled({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  @required Function validate,
  @required String lable,
  @required IconData prefixIcon,
  Color style
}) =>
  TextFormField(
    controller: controller,
    keyboardType: type,
    onChanged: onChange,
    onFieldSubmitted: onSubmit,
    validator: validate,
    decoration: InputDecoration(
      labelText: lable,
      fillColor: Colors.grey,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(),
    ),
    style: TextStyle(
      color: style
    ),
    autofocus: true,
    
    
  );

