import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';
import '../screens/filters_scree.dart';
class MainDrawer extends StatelessWidget {

 
  @override
  Widget buildListTile(String title, IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style:TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize:24,
          fontWeight:FontWeight.bold
        )
      ),
      onTap: tapHandler,
    );
  }

 
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cookingggg!!',
              style: TextStyle(
                fontWeight:FontWeight.w900,
                fontSize:30,
                color:Theme.of(context).primaryColor
              ),
            ),

          ),
          SizedBox(height:20),
          buildListTile('Meals', 
          Icons.restaurant,
            (){
            }
          ),
          buildListTile('Settings',Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          )
        ],
      ),
    );
  }
}