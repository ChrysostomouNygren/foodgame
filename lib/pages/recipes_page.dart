import 'package:drag_drop/components/back_to_start_btn.dart';
import 'package:drag_drop/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

@immutable
class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  List _recipesPls = [];
  List _ingredienser = [];
  List _instruktioner = [];

  Future<void> readJsonRecipe() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    setState(() {
      _recipesPls = data["recipes"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJsonRecipe();
  }

  void _buildRecipe(index) {
    setState(() {
      _ingredienser = _recipesPls[index]['ingredients'];
      _instruktioner = _recipesPls[index]['instructions'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildAppBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: const Back2StartBtn(),
      title: Text(
        'Recipes',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      elevation: 5,
      toolbarHeight: 120,
    );
  }

  Widget _buildAppBody() {
    return _recipesPls.isNotEmpty
        ? Column(
            children: [
              Expanded(
                  child: Scrollbar(
                thumbVisibility: true,
                // controller: _recipeController,
                thickness: 15,
                child: ListView.separated(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: _recipesPls.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 12.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RecipePage(
                              id: index,
                              name: _recipesPls[index]['name'],
                              img: _recipesPls[index]['img'],
                              ingredients: _recipesPls[index]['ingredients'],
                              instructions: _recipesPls[index]['instructions'],
                            );
                          }));
                        },
                        child: Material(
                          elevation: 12.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child:
                                        Image.asset(_recipesPls[index]['img']),
                                  ),
                                ),
                                const SizedBox(width: 30.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _recipesPls[index]['name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        _recipesPls[index]['description'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
            ],
          )
        : Container();
  }
}

//   Widget _buildContent() {
//     return _buildMenuList();
//   }

//   Widget _buildMenuList() {
//     return ListView.separated(
//       padding: const EdgeInsets.all(20.0),
//       itemCount: _recipes.length,
//       separatorBuilder: (context, index) {
//         return const SizedBox(
//           height: 12.0,
//         );
//       },
//       itemBuilder: (context, index) {
//         final item = _recipes[index];
//         return TextButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return RecipePage(id: index, name: item.name);
//             }));
//           },
//           child: _buildMenuItem(
//             item: item,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildMenuItem({
//     required Recipe item,
//   }) {
//     return MenuListItem(
//       name: item.name,
//       description: item.description,
//       photoProvider: item.imageProvider,
//     );
//   }
// }

// class MenuListItem extends StatelessWidget {
//   const MenuListItem({
//     super.key,
//     this.name = '',
//     this.description = '',
//     required this.photoProvider,
//     this.isPressed = false,
//   });

//   final String name;
//   final String description;
//   final ImageProvider photoProvider;
//   final bool isPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 12.0,
//       borderRadius: BorderRadius.circular(20),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             SizedBox(
//               width: 120,
//               height: 120,
//               child: Center(
//                 child: Image(
//                   image: photoProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 30.0),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleMedium
//                         ?.copyWith(fontSize: 25.0, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10.0),
//                   Text(
//                     description,
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                           fontSize: 18.0,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// @immutable
// class Recipe {
//   const Recipe({
//     required this.description,
//     required this.name,
//     required this.uid,
//     required this.imageProvider,
//   });
//   final String description;
//   final String name;
//   final int uid;
//   final ImageProvider imageProvider;
// }

// class Customer {
//   Customer({
//     required this.name,
//     required this.imageProvider,
//     List<Recipe>? items,
//   }) : items = items ?? [];

//   final String name;
//   final ImageProvider imageProvider;
//   final List<Recipe> items;
// }
