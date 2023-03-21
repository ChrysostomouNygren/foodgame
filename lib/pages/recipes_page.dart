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
      leading: Back2StartBtn(props: 'assets/images/back.png'),
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
      toolbarHeight: 100,
    );
  }

  Widget _buildAppBody() {
    return _recipesPls.isNotEmpty
        ? Column(
            children: [
              Expanded(
                  child: Scrollbar(
                thumbVisibility: true,
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
