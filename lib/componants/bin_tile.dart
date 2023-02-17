import 'package:flutter/material.dart';
import 'customer.dart';

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    super.key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Customer customer;
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
                // vvv stack so the widgets stack on top of eachother vvv
                child: Stack(
                  children: [
                    Image(
                      image: customer.imageProvider,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '${customer.items.length}',
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
