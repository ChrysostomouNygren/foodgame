import 'package:drag_drop/components/failed_modal.dart';
import 'package:drag_drop/components/star_clipper.dart';
import 'package:drag_drop/pages/home_page.dart';
import 'package:drag_drop/pages/recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/bin_tile.dart';
import '../components/item.dart';
import '../components/sorting.dart';
import 'dart:convert';

// const List<Item> _itemsConst = [
//   Item(
//     name: 'Banana',
//     healthy: true,
//     uid: 1,
//     imageProvider: AssetImage('assets/bananas.png'),
//   ),
//   Item(
//     name: 'Crisps',
//     healthy: false,
//     uid: 2,
//     imageProvider: AssetImage('assets/crisps.png'),
//   ),
//   Item(
//     name: 'Pizza',
//     healthy: false,
//     uid: 3,
//     imageProvider: AssetImage('assets/pizza.png'),
//   ),
//   Item(
//     name: 'Carrot',
//     healthy: true,
//     uid: 4,
//     imageProvider: AssetImage('assets/carrot.png'),
//   ),
//   Item(
//     name: 'Broccoli',
//     healthy: true,
//     uid: 5,
//     imageProvider: AssetImage('assets/broccoli.png'),
//   ),
//   Item(
//     name: 'Ice Cream',
//     healthy: false,
//     uid: 6,
//     imageProvider: AssetImage('assets/ice_cream.png'),
//   ),
//   Item(
//     name: 'Cheesecake',
//     healthy: false,
//     uid: 7,
//     imageProvider: AssetImage('assets/cheesecake.png'),
//   ),
// ];

// List<Item> _items = [
//   const Item(
//     name: 'Banana',
//     healthy: true,
//     uid: 1,
//     imageProvider: AssetImage('assets/bananas.png'),
//   ),
//   const Item(
//     name: 'Crisps',
//     healthy: false,
//     uid: 2,
//     imageProvider: AssetImage('assets/crisps.png'),
//   ),
//   const Item(
//     name: 'Pizza',
//     healthy: false,
//     uid: 3,
//     imageProvider: AssetImage('assets/pizza.png'),
//   ),
//   const Item(
//     name: 'Carrot',
//     healthy: true,
//     uid: 4,
//     imageProvider: AssetImage('assets/carrot.png'),
//   ),
//   const Item(
//     name: 'Broccoli',
//     healthy: true,
//     uid: 5,
//     imageProvider: AssetImage('assets/broccoli.png'),
//   ),
//   const Item(
//     name: 'Ice Cream',
//     healthy: false,
//     uid: 6,
//     imageProvider: AssetImage('assets/ice_cream.png'),
//   ),
//   const Item(
//     name: 'Cheesecake',
//     healthy: false,
//     uid: 7,
//     imageProvider: AssetImage('assets/cheesecake.png'),
//   ),
//   const Item(
//       name: 'Almond',
//       healthy: true,
//       uid: 8,
//       imageProvider: AssetImage('assets/almonds.png')),
//   const Item(
//       name: 'Avocado',
//       healthy: true,
//       uid: 9,
//       imageProvider: AssetImage('assets/avocado.png')),
//   const Item(
//       name: 'Hamburger',
//       healthy: false,
//       uid: 10,
//       imageProvider: AssetImage('assets/burger.png')),
//   const Item(
//       name: 'Cauliflower',
//       healthy: true,
//       uid: 11,
//       imageProvider: AssetImage('assets/cauliflower.png')),
//   const Item(
//       name: 'Corn',
//       healthy: true,
//       uid: 12,
//       imageProvider: AssetImage('assets/corn.png')),
//   const Item(
//       name: 'Walnuts',
//       healthy: true,
//       uid: 13,
//       imageProvider: AssetImage('assets/walnut.png')),
//   const Item(
//       name: 'Fried chicken',
//       healthy: false,
//       uid: 14,
//       imageProvider: AssetImage('assets/fried_chicken.png')),
//   const Item(
//       name: 'Fries',
//       healthy: false,
//       uid: 15,
//       imageProvider: AssetImage('assets/fries.png')),
//   const Item(
//       name: 'Ketchup',
//       healthy: false,
//       uid: 16,
//       imageProvider: AssetImage('assets/ketchup.png')),
//   const Item(
//       name: 'Lemon',
//       healthy: true,
//       uid: 17,
//       imageProvider: AssetImage('assets/lemon.png')),
//   const Item(
//       name: 'Lentils',
//       healthy: true,
//       uid: 18,
//       imageProvider: AssetImage('assets/lentils.png')),
//   const Item(
//       name: 'Mashed potatoes',
//       healthy: false,
//       uid: 19,
//       imageProvider: AssetImage('assets/mashed_potatoes.png')),
//   const Item(
//       name: 'Salmon',
//       healthy: true,
//       uid: 20,
//       imageProvider: AssetImage('assets/salmon.png')),
//   const Item(
//       name: 'Sweet potatoes',
//       healthy: true,
//       uid: 21,
//       imageProvider: AssetImage('assets/sweet_potatoes.png')),
//   const Item(
//       name: 'Toilet paper',
//       healthy: false,
//       uid: 22,
//       imageProvider: AssetImage('assets/toilet_paper.png')),
// ];

@immutable
class DragAndDropGame extends StatefulWidget {
  DragAndDropGame({super.key}) {
    // _items.shuffle();
    // _items.length = 6;
  }

  @override
  State<DragAndDropGame> createState() => _DragAndDropGameState();
}

class _DragAndDropGameState extends State<DragAndDropGame>
    with TickerProviderStateMixin {
  final List<Sorting> _sortingButtons = [
    Sorting(
      type: 'Add',
      imageProvider: const AssetImage('assets/cart.png'),
      healthy: true,
    ),
    Sorting(
      type: 'Pass',
      imageProvider: const AssetImage('assets/trash.png'),
      healthy: false,
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  List _gameItems = [];
  List _constGameItems = [];
  Future<void> readJsonItems() async {
    final String response =
        await rootBundle.loadString('assets/game_items.json');
    final data = await json.decode(response);
    setState(() {
      _gameItems = data['items'];
      _constGameItems = data['items'];
    });
    _gameItems.shuffle();
    _gameItems.length = 6;
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
          succesfullDialogModal();
        }
      } else if (!item['healthy'] && !type.healthy) {
        type.items.add(item);
        _gameItems.removeWhere((produce) => produce['id'] == item['id']);
        if (_gameItems.isEmpty) {
          succesfullDialogModal();
        }
      } else if (!item['healthy'] && type.healthy) {
        failedDialogModal(context);
      } else if (item['healthy'] && !type.healthy) {
        failedDialogModal(context);
      }
    });
  }

  Future<String?> succesfullDialogModal() {
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
                  'assets/trophy.png',
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
                      readJsonItems();
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/play_again.png',
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Play again'),
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
                          'assets/recipes.png',
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
                    'assets/stop.png',
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
                          'assets/play_again.png',
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
                          'assets/cancel.png',
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
              image: AssetImage('assets/background.jpg'),
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
          child: Image.asset('assets/close.png'),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
      leading: cancelBtn(),
      title: Text(
        'Pick the healthy food',
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
                child: _buildMenuList(),
              ),
              _buildSortingRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(_gameItems.length, (index) {
        return TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _buildMenuItem(item: _gameItems[index]);
              }));
            },
            child: _buildMenuItem(item: _gameItems[index]));
      }),
    );
  }

  Widget _buildMenuItem({
    required item,
  }) {
    return LongPressDraggable(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        img: item['img'],
      ),
      child: MenuListItem(
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

class MenuListItem extends StatelessWidget {
  const MenuListItem({
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

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
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
