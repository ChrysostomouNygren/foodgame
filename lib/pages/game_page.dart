import 'package:drag_drop/components/failed_modal.dart';
import 'package:drag_drop/components/star_clipper.dart';
import 'package:drag_drop/pages/home_page.dart';
import 'package:drag_drop/pages/recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/bin_tile.dart';
import '../components/sorting.dart';
import 'dart:convert';

@immutable
class DragAndDropGame extends StatefulWidget {
  const DragAndDropGame({super.key});

  @override
  State<DragAndDropGame> createState() => _DragAndDropGameState();
}

class _DragAndDropGameState extends State<DragAndDropGame>
    with TickerProviderStateMixin {
  final List<Sorting> _sortingButtons = [
    Sorting(
      type: 'Add',
      imageProvider: const AssetImage('assets/images/cart.png'),
      healthy: true,
    ),
    Sorting(
      type: 'Pass',
      imageProvider: const AssetImage('assets/images/trash.png'),
      healthy: false,
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  int level = 20;
  List _gameItems = [];
  Future<void> readJsonItems() async {
    final String response =
        await rootBundle.loadString('assets/game_items.json');
    final data = await json.decode(response);
    setState(() {
      _gameItems = data['items'];
    });
    _gameItems.shuffle();
    _gameItems.length = level;
  }

  @override
  void initState() {
    super.initState();
    readJsonItems();
  }

  void _itemDroppedOnSortingButton({
    required item,
    required Sorting type,
  }) {
    setState(() {
      if (item['healthy'] && type.healthy) {
        type.items.add(item);
        _gameItems.removeWhere((produce) => produce['id'] == item['id']);
        if (_gameItems.isEmpty) {
          succesfullModal();
        }
      } else if (!item['healthy'] && !type.healthy) {
        type.items.add(item);
        _gameItems.removeWhere((produce) => produce['id'] == item['id']);
        if (_gameItems.isEmpty) {
          succesfullModal();
        }
      } else if (!item['healthy'] && type.healthy) {
        failedModal(context);
      } else if (item['healthy'] && !type.healthy) {
        failedModal(context);
      }
    });
  }

  Future<String?> succesfullModal() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(alignment: Alignment.center, children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ClipPath(
                    clipper: StarClipper(14),
                    child: Container(
                      height: 150,
                      color: const Color.fromARGB(255, 0, 255, 0),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/trophy.png',
                  height: 140,
                  fit: BoxFit.fill,
                ),
              ]),
              const SizedBox(height: 15),
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 30),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Would you like to try again, or view your recipies?',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 15,
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
                      level = level + 1;
                      readJsonItems();
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/play_again.png',
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Play level ${level + 1}'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 15,
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Recipes();
                      }));
                      setState(() {
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
                      readJsonItems();
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/recipes.png',
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Recipes'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> cancelModal(context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                    width: 200,
                  ),
                  Image.asset(
                    'assets/images/stop.png',
                    height: 120,
                    fit: BoxFit.fill,
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Are you sure you want to cancel the game?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 15,
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/play_again.png',
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Resume'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 15,
                        )),
                    onPressed: () {
                      setState(() {
                        _gameItems.clear();
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                      readJsonItems();
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/cancel.png',
                          height: 45,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Cancel'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: _buildContent(),
        ));
  }

  Widget cancelBtn() {
    return TextButton(
        onPressed: () {
          cancelModal(context);
        },
        child: SizedBox(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/close.png'),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
      leading: cancelBtn(),
      title: Text(
        'Level $level',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 30,
              color: const Color.fromARGB(255, 3, 39, 52),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
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
                child: _buildGameGrid(),
              ),
              _buildSortingRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGameGrid() {
    return GridView.count(
      crossAxisCount: level < 2
          ? 1
          : level < 7
              ? 2
              : level < 16
                  ? 3
                  : 4,
      shrinkWrap: true,
      children: List.generate(_gameItems.length, (index) {
        return GestureDetector(
          onLongPress: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return _buildGameItem(item: _gameItems[index]);
            })));
          },
          child: _buildGameItem(item: _gameItems[index]),
        );
      }),
    );
  }

  Widget _buildGameItem({
    required item,
  }) {
    return LongPressDraggable(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingGameItem(
        dragKey: _draggableKey,
        img: item['img'],
      ),
      child: GameItem(
        name: item['name'],
        img: item['img'],
      ),
    );
  }

  Widget _buildSortingRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20.0,
      ),
      child: Row(
        children: _sortingButtons.map(_buildBtnWithDropZone).toList(),
      ),
    );
  }

  Widget _buildBtnWithDropZone(Sorting type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget(
          builder: (context, candidateItems, rejectedItems) {
            return SortingTile(
              hasItems: type.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              type: type,
            );
          },
          onAccept: (item) {
            _itemDroppedOnSortingButton(
              item: item,
              type: type,
            );
          },
        ),
      ),
    );
  }
}

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    this.name = '',
    required this.img,
    this.isPressed = false,
  });

  final String name;
  final String img;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: SizedBox(
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                height: isPressed ? 115 : 120,
                width: isPressed ? 115 : 120,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(img),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DraggingGameItem extends StatelessWidget {
  const DraggingGameItem({
    super.key,
    required this.dragKey,
    required this.img,
  });

  final GlobalKey dragKey;
  final String img;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
