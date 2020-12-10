import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';


class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItem(this.id,this.title,this.color);
  
  selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,arguments: {
      'id':id,
      'title':title
    });
  } 


  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: ()=>(selectMeal(context)),
          splashColor: Theme.of(context).primaryColor,
          child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end:Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.circular(15)
          ),
      ),
    );
  }
}