import 'package:flutter/material.dart';
import 'package:recipe_app/models/meals.dart';
import 'package:flutter/foundation.dart';
import '../screens/meal_items_scree.dart';

class MealItem extends StatelessWidget {
final String id;
final String title;
final String imageUrl;
final int duration;
final Complexity complexity;
final Affordability affordability;
final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem
  });

  void inMeal(context){
    Navigator.of(context).pushNamed(MealItemScreen.routeName , arguments: id)
    .then((value){
      if(value != null){
        removeItem(value);
      }
    });
  }
  
  String get complexityString{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
      return 'Unknown';
    }
  }
  String get affordabilityString{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Very Expensive';
        break;
      default:
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>inMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children:<Widget>[
                ClipRRect(
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  
                  ) ,
                  child: Image.network(
                    imageUrl,
                    height:250,
                    width: double.infinity,
                    fit:BoxFit.cover
                    ),
                  ),
                  Positioned(
                      bottom: 15,
                      right:15,
                      child: Container(
                        width: 300,
                        color: Colors.black87,
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal:10),
                        child: Text(
                        title,
                        style:TextStyle(
                          fontSize:26,
                          color:Colors.white
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                    ),
                      ),
                  )
              ]
            ),
            Padding(
              padding:EdgeInsets.all(20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(width: 6),
                      Text('$duration min')
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityString)
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(width: 6),
                      Text(affordabilityString)
                    ]
                  ),
                ],
              )
            )
          ],
        )
        
      ),
    );
  }
}