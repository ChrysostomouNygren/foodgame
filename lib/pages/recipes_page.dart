import 'package:flutter/material.dart';

const List<Recipe> _recipes = [
  Recipe(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
  ),
  Recipe(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
  ),
  Recipe(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage('https://flutter'
        '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
  ),
];

@immutable
class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  // final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      title: Text(
        'recipes',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 36,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 5,
      toolbarHeight: 120,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildMenuList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _recipes.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12.0,
        );
      },
      itemBuilder: (context, index) {
        final item = _recipes[index];
        return _buildMenuItem(
          item: item,
        );
      },
    );
  }

  Widget _buildMenuItem({
    required Recipe item,
  }) {
    return MenuListItem(
      name: item.name,
      price: item.formattedTotalItemPrice,
      photoProvider: item.imageProvider,
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  });

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class Recipe {
  const Recipe({
    required this.totalPriceCents,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;
  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  Customer({
    required this.name,
    required this.imageProvider,
    List<Recipe>? items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Recipe> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
        items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}





// const List<RecipeType> _recipes = [
//   RecipeType(
//       title: 'Oatmeal',
//       imageProvider: NetworkImage(
//           'https://cdn-icons-png.flaticon.com/512/5609/5609775.png'),
//       description: 'Simple breakfast, made quick and easy',
//       uid: 1),
//   RecipeType(
//       title: 'Cucumber Salad',
//       imageProvider: NetworkImage(
//           'https://cdn-icons-png.flaticon.com/512/5609/5609775.png'),
//       description: 'I know it is the wrong picture, dont come for me',
//       uid: 2),
// ];

// Widget buildRecipeList() {
//   return ListView.separated(
//     padding: const EdgeInsets.all(100.0),
//     itemCount: _recipes.length,
//     separatorBuilder: (context, index) {
//       return const SizedBox(
//         height: 10.0,
//       );
//     },
//     itemBuilder: (context, index) {
//       final recipeType = _recipes[index];
//       return _buildRecipeCard(recipeType: recipeType);
//     },
//   );
// }

// Widget _buildRecipeCard({
//   required RecipeType recipeType,
// }) {
//   return RecipeCard(
//     title: recipeType.title,
//     imageProvider: recipeType.imageProvider,
//     description: recipeType.description,
//     uid: recipeType.uid,
//   );
// }

// // Lägga in skapade recipecards in i en array?
// class RecipeCard extends StatelessWidget {
//   const RecipeCard({
//     super.key,
//     required this.title,
//     required this.imageProvider,
//     required this.description,
//     required this.uid,
//   });

//   final String title;
//   final ImageProvider imageProvider;
//   final String description;
//   final int uid;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 10.0,
//       borderRadius: BorderRadius.circular(20),
//       child: Center(
//         child: Column(
//           children: [
//             Image(image: imageProvider),
//             Text(title),
//             Text(description)
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Recipes extends StatelessWidget {
//   const Recipes({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(40.0),
//             child: BackBtn(),
//           ),
//           // vvv får det att krascha vvv
//           // buildRecipeList(),
//           // _recipes.map((recipe) => return RecipeCard(title: recipe.title, imageProvider: recipe.imageProvider, description: recipe.description, uid: recipe.uid)),
//           Center(
//             child: SizedBox(
//               height: 200,
//               child: Column(children: [
//                 // .map thru data
//                 // ************************************
//                 TextButton(
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) {
//                         return const Recipe();
//                       }));
//                     },
//                     child:
//                         // buildRecipeList()
//                         const Text('härkommererecept'))
//               ]),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// @immutable
// class RecipeType {
//   const RecipeType({
//     required this.title,
//     required this.imageProvider,
//     required this.description,
//     required this.uid,
//   });
//   final String title;
//   final ImageProvider imageProvider;
//   final String description;
//   final int uid;
// }
