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
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 80,
              ),
              Expanded(
                  child: Container(
                color: const Color.fromRGBO(251, 241, 152, 0.2),
                child: ListView.separated(
                    itemBuilder: (context, index) {
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
                              activeColor: const Color.fromARGB(255, 3, 39, 52),
                              checkColor: Colors.white,
                            ),
                          ),
                          Flexible(
                              child: Text(
                            widget.ingredients[index]['ingredient'],
                            style: const TextStyle(fontSize: 18),
                          )),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: widget.ingredients.length),
              )),
              Expanded(
                  child: Container(
                color: const Color.fromRGBO(251, 241, 152, 0.2),
                child: ListView.separated(
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
                              activeColor: const Color.fromARGB(255, 3, 39, 52),
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
              ))
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
