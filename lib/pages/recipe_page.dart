import 'package:drag_drop/components/back_btn.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage(
      {Key? key,
      required this.id,
      required this.name,
      required this.img,
      required this.ingredients,
      required this.instructions})
      : super(key: key);

  final int id;
  final String name;
  final String img;
  final List ingredients;
  final List instructions;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final ScrollController _ingredientsController = ScrollController();
  final ScrollController _instructionsController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(widget.name),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                widget.img,
                height: 180,
                width: 180,
              ),
              const SizedBox(
                height: 80,
              ),
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                  child: Material(
                elevation: 10,
                child: Container(
                    child: Scrollbar(
                  thumbVisibility: true,
                  controller: _ingredientsController,
                  thickness: 10,
                  child: GridView.count(
                    controller: _ingredientsController,
                    childAspectRatio: 4,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: List.generate(widget.ingredients.length, (index) {
                      return Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    const Color.fromARGB(255, 3, 39, 52)),
                            child: Checkbox(
                              value: widget.ingredients[index]['added'],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.ingredients[index]['added'] = value!;
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: const Color.fromARGB(255, 3, 39, 52),
                            ),
                          ),
                          Flexible(
                              child: Text(
                            widget.ingredients[index]['ingredient'],
                            style: const TextStyle(fontSize: 18),
                          ))
                        ],
                      );
                    }),
                  ),
                )),
              )),
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                  child: Material(
                elevation: 10,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _instructionsController,
                  thickness: 10,
                  child: ListView.separated(
                      controller: _instructionsController,
                      itemBuilder: ((context, index) {
                        return Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor:
                                      const Color.fromARGB(255, 3, 39, 52)),
                              child: Checkbox(
                                value: widget.instructions[index]['done'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.instructions[index]['done'] = value!;
                                  });
                                },
                                activeColor:
                                    const Color.fromARGB(255, 3, 39, 52),
                                checkColor: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.instructions[index]['instruction'],
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: widget.instructions.length),
                ),
              )),
            ],
          ),
        ));
  }
}

PreferredSizeWidget _buildAppBar(name) {
  return AppBar(
    iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
    leading: const BackBtn(),
    title: Text(name,
        style: const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 3, 39, 52),
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: const Color.fromARGB(255, 247, 247, 247),
    elevation: 5,
    toolbarHeight: 120,
  );
}
