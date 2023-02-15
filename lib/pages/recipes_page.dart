import 'package:drag_drop/componants/back_btn.dart';
// import 'package:drag_drop/componants/recipe_card.dart';
import 'package:drag_drop/pages/recipe_page.dart';
import 'package:flutter/material.dart';

const List<RecipeType> _recipes = [
  RecipeType(
      title: 'Oatmeal',
      imageProvider: NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/5609/5609775.png'),
      description: 'Simple breakfast, made quick and easy',
      uid: 1),
  RecipeType(
      title: 'Cucumber Salad',
      imageProvider: NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/5609/5609775.png'),
      description: 'I know it is the wrong picture, dont come for me',
      uid: 2),
];

Widget buildRecipeList() {
  return ListView.separated(
    padding: const EdgeInsets.all(100.0),
    itemCount: _recipes.length,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 10.0,
      );
    },
    itemBuilder: (context, index) {
      final recipeType = _recipes[index];
      return _buildRecipeCard(recipeType: recipeType);
    },
  );
}

Widget _buildRecipeCard({
  required RecipeType recipeType,
}) {
  return RecipeCard(
    title: recipeType.title,
    imageProvider: recipeType.imageProvider,
    description: recipeType.description,
    uid: recipeType.uid,
  );
}

// Lägga in skapade recipecards in i en array?
class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.title,
    required this.imageProvider,
    required this.description,
    required this.uid,
  });

  final String title;
  final ImageProvider imageProvider;
  final String description;
  final int uid;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Column(
          children: [
            Image(image: imageProvider),
            Text(title),
            Text(description)
          ],
        ),
      ),
    );
  }
}

class Recipes extends StatelessWidget {
  const Recipes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: BackBtn(),
          ),
          // vvv får det att krascha vvv
          // buildRecipeList(),
          // _recipes.map((recipe) => return RecipeCard(title: recipe.title, imageProvider: recipe.imageProvider, description: recipe.description, uid: recipe.uid)),
          Center(
            child: SizedBox(
              height: 200,
              child: Column(children: [
                // .map thru data
                // ************************************
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Recipe();
                      }));
                    },
                    child:
                        // buildRecipeList()
                        const Text('härkommererecept'))
              ]),
            ),
          )
        ],
      ),
    );
  }
}

@immutable
class RecipeType {
  const RecipeType({
    required this.title,
    required this.imageProvider,
    required this.description,
    required this.uid,
  });
  final String title;
  final ImageProvider imageProvider;
  final String description;
  final int uid;
}
