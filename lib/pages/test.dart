import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Testiluring extends StatefulWidget {
  const Testiluring({super.key});

  @override
  State<Testiluring> createState() => _TestiluringState();
}

class _TestiluringState extends State<Testiluring> {
  List _recipesPls = [];

  Future<void> readJsonRecipe() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    setState(() {
      _recipesPls = data["recipes"];
    });
  }

  Widget _buildIngredients(index) {
    List ingredienser = _recipesPls[index]['ingredients'];
    // vv tar emot rätt index vv
    print(index);
    // vv tar emot rätt lista av ingredienser vv
    print(ingredienser);

    return ListView.builder(
        itemCount: ingredienser.length,
        itemBuilder: ((context, index) {
          return Row(
            children: [
              Checkbox(
                  value: ingredienser[index]['done'],
                  onChanged: (bool? value) {
                    setState(() {
                      ingredienser[index]['done'] = value!;
                    });
                  }),
              Text(ingredienser[index]['ingredient']),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          readJsonRecipe();
        },
        child: Column(
          children: [
            const Text('oatmeal? pls?'),
            _recipesPls.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _recipesPls.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: Image.asset(
                                  _recipesPls[index]['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(_recipesPls[index]['name']),
                              subtitle: Text(_recipesPls[index]['description']),
                              onTap: () {
                                _buildIngredients(index);
                              },
                            ),
                          );
                        }))
                : Container(),
          ],
        ));
  }
}
