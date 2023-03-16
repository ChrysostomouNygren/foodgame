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
  List _ingredienser = [];
  List _instruktioner = [];

  Future<void> readJsonRecipe() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    setState(() {
      _recipesPls = data["recipes"];
    });
  }

  void _buildRecipe(index) {
    setState(() {
      _ingredienser = _recipesPls[index]['ingredients'];
      _instruktioner = _recipesPls[index]['instructions'];
    });
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
                                _buildRecipe(index);
                              },
                            ),
                          );
                        }))
                : Container(),
            _ingredienser.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _ingredienser.length,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              Checkbox(
                                  value: _ingredienser[index]['added'],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _ingredienser[index]['added'] = value!;
                                    });
                                  }),
                              Text(_ingredienser[index]['ingredient']),
                            ],
                          );
                        })))
                : Container(),
            _instruktioner.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _instruktioner.length,
                        itemBuilder: ((context, index) {
                          return Row(
                            children: [
                              Checkbox(
                                  value: _instruktioner[index]['done'],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _instruktioner[index]['done'] = value!;
                                    });
                                  }),
                              Text(_instruktioner[index]['instruction']),
                            ],
                          );
                        })))
                : Container()
          ],
        ));
  }
}
