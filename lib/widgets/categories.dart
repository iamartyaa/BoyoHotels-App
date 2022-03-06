import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String img;

  const CategoryItem(
      {Key? key, required this.id, required this.title, required this.img})
      : super(key: key);

  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMealsScreen(categoryId: id,categoryTitle: title);
  //       },
  //     ),
  //   );
  // }

  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx)
  //       .pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // selectCategory(context);
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(

              padding: const EdgeInsets.all(15),
              child: Image.asset(img,fit: BoxFit.cover,)
            ),
          ],
        ));
  }
}
