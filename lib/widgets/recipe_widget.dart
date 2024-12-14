import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 200,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset('assets/images/salad.png'),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,color: Colors.white,))
              ],
            ),
            Text('Healthy Taco Salad'),
            Row(
              children: [
                Icon(Icons.local_fire_department_outlined),
                Text('120 Kcal'),
                Icon(Icons.alarm),
                Text('20 Min')
              ],
            )
          ],
        ),
      ),
    );
  }
}
