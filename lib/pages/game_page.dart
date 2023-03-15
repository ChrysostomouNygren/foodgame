import 'package:drag_drop/components/cancel_btn.dart';
import 'package:drag_drop/components/failed_modal.dart';
import 'package:drag_drop/components/star_clipper.dart';
import 'package:drag_drop/pages/home_page.dart';
import 'package:drag_drop/pages/recipes_page.dart';
import 'package:flutter/material.dart';
import '../components/bin_tile.dart';
import '../components/item.dart';
import '../components/sorting.dart';

const List<Item> _itemsConst = [
  // ignore: prefer_const_constructors
  Item(
    name: 'Banana',
    healthy: true,
    uid: 1,
    imageProvider: AssetImage('assets/bananas.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Crisps',
    healthy: false,
    uid: 2,
    imageProvider: AssetImage('assets/crisps.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Pizza',
    healthy: false,
    uid: 3,
    imageProvider: AssetImage('assets/pizza.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Carrot',
    healthy: true,
    uid: 4,
    imageProvider: AssetImage('assets/carrot.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Broccoli',
    healthy: true,
    uid: 5,
    imageProvider: AssetImage('assets/broccoli.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Ice Cream',
    healthy: false,
    uid: 6,
    imageProvider: AssetImage('assets/ice_cream.png'),
  ),
];

List<Item> _items = [
  // ignore: prefer_const_constructors
  Item(
    name: 'Banana',
    healthy: true,
    uid: 1,
    imageProvider: AssetImage('assets/bananas.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Crisps',
    healthy: false,
    uid: 2,
    imageProvider: AssetImage('assets/crisps.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Pizza',
    healthy: false,
    uid: 3,
    imageProvider: AssetImage('assets/pizza.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Carrot',
    healthy: true,
    uid: 4,
    imageProvider: AssetImage('assets/carrot.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Broccoli',
    healthy: true,
    uid: 5,
    imageProvider: AssetImage('assets/broccoli.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Ice Cream',
    healthy: false,
    uid: 6,
    imageProvider: AssetImage('assets/ice_cream.png'),
  ),
];

@immutable
class DragAndDropGame extends StatefulWidget {
  DragAndDropGame({super.key}) {
    _items.shuffle();
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

  void _itemDroppedOnSortingButton({
    required Item item,
    required Sorting type,
  }) {
    setState(() {
      if (item.healthy && type.healthy) {
        type.items.add(item);
        _items.removeWhere((produce) => produce.uid == item.uid);
        if (_items.isEmpty) {
          succesfullDialogModal();
        }
      } else if (!item.healthy && !type.healthy) {
        type.items.add(item);
        _items.removeWhere((produce) => produce.uid == item.uid);
        if (_items.isEmpty) {
          succesfullDialogModal();
        }
      } else if (!item.healthy && type.healthy) {
        failedDialogModal(context);
      } else if (item.healthy && !type.healthy) {
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
                        _items.addAll(_itemsConst);
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
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
                        _items.addAll(_itemsConst);
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
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
                        _items.clear();
                        _items.addAll(_itemsConst);
                        for (var btn in _sortingButtons) {
                          btn.items.clear();
                        }
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
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
      children: List.generate(_items.length, (index) {
        final item = _items[index];

        return TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _buildMenuItem(item: item);
              }));
            },
            child: _buildMenuItem(item: item));
      }),
    );
  }

  Widget _buildMenuItem({
    required Item item,
  }) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        photoProvider: item.imageProvider,
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
        child: DragTarget<Item>(
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
    required this.photoProvider,
    this.isPressed = false,
  });

  final String name;
  final ImageProvider photoProvider;
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
                      image: photoProvider,
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
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

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
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
