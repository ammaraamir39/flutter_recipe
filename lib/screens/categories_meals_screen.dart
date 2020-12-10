import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  
  static const routeName="/category-meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String mealTitle;
List <Meal> displayedMeals;
bool _loadedInitData=false;

@override
  void initState() {
  
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    
    if(!_loadedInitData){
      final routeArgs=  ModalRoute.of(context).settings.arguments as Map<String,String>;
   mealTitle = routeArgs['title'];
  final String mealId=routeArgs['id'];
  displayedMeals= DUMMY_MEALS.where((meal){
    return meal.categories.contains(mealId);
  }).toList();

    }
    _loadedInitData=true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title:Text(
        mealTitle
      )),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx,index){
            return MealItem(
              title:displayedMeals[index].title,
              id: displayedMeals[index].id,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              removeItem: _removeMeal,
            );
        }, itemCount: displayedMeals.length)
      ),
    );
  }
}