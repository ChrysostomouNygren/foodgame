import 'package:flutter/material.dart';
import 'sorting.dart';

class SortingTile extends StatelessWidget {
  const SortingTile({
    super.key,
    required this.type,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Sorting type;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted
            ? const Color.fromARGB(255, 88, 162, 136)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: Stack(
                  children: [
                    Image(
                      image: type.imageProvider,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(201, 226, 231, 1),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '${type.items.length}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
