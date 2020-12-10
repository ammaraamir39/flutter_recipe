import 'package:flutter/material.dart';


import '../dummy_data.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData)=>(
          CategoriesItem(catData.id,catData.title,catData.color)
        )).toList(),
 
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3/2
          ) 
        );
    
  }
}