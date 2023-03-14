import 'package:drag_drop/componants/cancel_btn.dart';
import 'package:drag_drop/componants/failed_modal.dart';
import 'package:drag_drop/componants/star_clipper.dart';
import 'package:drag_drop/pages/recipes_page.dart' hide Customer;
import 'package:flutter/material.dart';
import '../componants/bin_tile.dart';
import '../componants/item.dart';
import '../componants/sorting.dart';

const List<Item> _itemsConst = [
  // ignore: prefer_const_constructors
  Item(
    name: 'Banana',
    healthy: true,
    uid: 1,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/2909/2909761.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Crisps',
    healthy: false,
    uid: 2,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/3050/3050268.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Pizza',
    healthy: false,
    uid: 3,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/3595/3595458.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Carrot',
    healthy: true,
    uid: 4,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/883/883760.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Broccoli',
    healthy: true,
    uid: 5,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/2347/2347045.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Ice Cream',
    healthy: false,
    uid: 6,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/938/938063.png'),
  ),
];

// Can't be const due to changes in the list
List<Item> _items = [
  // ignore: prefer_const_constructors
  Item(
    name: 'Banana',
    healthy: true,
    uid: 1,
    imageProvider: const NetworkImage(
        'https://cdn-icons-png.flaticon.com/512/2909/2909761.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Crisps',
    healthy: false,
    uid: 2,
    imageProvider: const NetworkImage(
        'https://cdn-icons-png.flaticon.com/512/3050/3050268.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Pizza',
    healthy: false,
    uid: 3,
    imageProvider: const NetworkImage(
        'https://cdn-icons-png.flaticon.com/512/3595/3595458.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Carrot',
    healthy: true,
    uid: 4,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/883/883760.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Broccoli',
    healthy: true,
    uid: 5,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/2347/2347045.png'),
  ),
  // ignore: prefer_const_constructors
  Item(
    name: 'Ice Cream',
    healthy: false,
    uid: 6,
    imageProvider:
        NetworkImage('https://cdn-icons-png.flaticon.com/512/938/938063.png'),
  ),
];

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  final List<Sorting> _people = [
    Sorting(
      type: 'Add',
      imageProvider: const NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/819/819781.png'),
      healthy: true,
    ),
    Sorting(
      type: 'Pass',
      imageProvider: const NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/1587/1587618.png'),
      healthy: false,
    ),
  ];

  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
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

// succesfull dialog modal
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
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1705/1705348.png',
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
                        for (var pers in _people) {
                          pers.items.clear();
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2550/2550386.png',
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
                        for (var pers in _people) {
                          pers.items.clear();
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2729/2729077.png',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://st2.depositphotos.com/1187563/9421/i/950/depositphotos_94218180-stock-photo-wired-fence-pattern.jpg"),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: _buildContent(),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(166, 247, 247, 247)),
      leading: const CancelBtn(),
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
              _buildPeopleRow(),
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

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 20.0,
      ),
      child: Row(
        children: _people.map(_buildPersonWithDropZone).toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(Sorting type) {
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
            _itemDroppedOnCustomerCart(
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
