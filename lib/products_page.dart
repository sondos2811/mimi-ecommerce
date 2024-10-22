import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  const ProductsPage({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int activeButton = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            widget.image,
            height: 400,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          BottomAppBar(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          activeButton = 1; 
                        });
                      },
                      icon: Icon(
                        Icons.home,
                        color: activeButton == 1
                            ? const Color.fromARGB(
                                255, 84, 65, 129) 
                            : Colors.grey, 
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          activeButton = 2; 
                        });
                      },
                      icon: Icon(
                        Icons.store,
                        color: activeButton == 2
                            ? const Color.fromARGB(
                                255, 84, 65, 129) 
                            : Colors.grey, 
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          activeButton = 3; 
                        });
                      },
                      icon: Icon(
                        Icons.settings,
                        color: activeButton == 3
                            ? const Color.fromARGB(
                                255, 84, 65, 129) 
                            : Colors.grey, 
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
