import 'package:drag_drop/componants/back_to_start_btn.dart';
import 'package:drag_drop/pages/recipe_page.dart';
import 'package:flutter/material.dart';

const List<Recipe> _recipes = [
  Recipe(
    name: 'Oatmeal',
    description: 'Simple breakfast, made quick and easy.',
    uid: 1,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/5609/5609775.png'),
  ),
  Recipe(
      name: 'Veggie soup',
      description: 'Rich and flavourful treat for the colder days.',
      uid: 2,
      imageProvider: NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/2388/2388080.png')),
  Recipe(
      name: 'Greek salad',
      description:
          'Easy to make! You could either have it by it self or as a side dish.',
      uid: 3,
      imageProvider: NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/5100/5100241.png'))
];

@immutable
class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
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

  Widget _buildContent() {
    return _buildMenuList();
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
        return TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RecipePage(
                id: index,
              );
            }));
          },
          child: _buildMenuItem(
            item: item,
          ),
        );
      },
    );
  }

  Widget _buildMenuItem({
    required Recipe item,
  }) {
    return MenuListItem(
      name: item.name,
      description: item.description,
      photoProvider: item.imageProvider,
    );
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    this.name = '',
    this.description = '',
    required this.photoProvider,
    this.isPressed = false,
  });

  final String name;
  final String description;
  final ImageProvider photoProvider;
  final bool isPressed;

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
            SizedBox(
              width: 120,
              height: 120,
              child: Center(
                child: Image(
                  image: photoProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
    required this.description,
    required this.name,
    required this.uid,
    required this.imageProvider,
  });
  final String description;
  final String name;
  final int uid;
  final ImageProvider imageProvider;
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
}
