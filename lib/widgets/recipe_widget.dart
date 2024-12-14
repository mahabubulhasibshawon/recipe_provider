import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final String image;
  final String foodName;
  final String cal;
  final String time;

  const RecipeWidget({super.key, required this.image, required this.foodName, required this.cal, required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 250,
        width: 200,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(image),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,color: Colors.white,))
              ],
            ),
            Spacer(),
            Text(foodName),
            Spacer(),
            Row(
              children: [
                Icon(Icons.local_fire_department_outlined),
                Text(cal),
                Icon(Icons.alarm),
                Text(time)
              ],
            )
          ],
        ),
      ),
    );
  }
}
