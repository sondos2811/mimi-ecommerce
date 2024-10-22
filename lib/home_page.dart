// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mini_ecommerce/category_item.dart';
import 'package:mini_ecommerce/products_item.dart';
import 'package:mini_ecommerce/products_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeButton = 1;
  int selectedIndex = -1;
  List<Map> products = [
    {
      'img': 'image/basket.jpg',
      'title': 'product 1',
      'des': 'description ...',
      'price': '340\$'
    },
    {
      'img': 'image/bingbong.jpg',
      'title': 'product 2',
      'des': 'description ...',
      'price': '340\$'
    },
    {
      'img': 'image/basket.jpg',
      'title': 'product 3',
      'des': 'description ...',
      'price': '340\$'
    },
    {
      'img': 'image/bingbong.jpg',
      'title': 'product 4',
      'des': 'description ...',
      'price': '340\$'
    },
  ];

  List<Map> cats = [
    {'icon': Icons.sports_baseball, 'active': true, 'txt': 'Sports'},
    {'icon': Icons.devices, 'active': false, 'txt': 'Devices'},
    {'icon': Icons.book, 'active': false, 'txt': 'Books'},
    {'icon': Icons.local_mall, 'active': false, 'txt': 'Clothes'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          Container(
            width: 330,
            color: const Color.fromARGB(255, 238, 238, 238),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                const Text(
                  "Search",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
      body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Categories",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 350, 
              height: 110,
              child: ListView.builder(
                itemCount: cats.length,
                scrollDirection: Axis.horizontal, 
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                    icon_category: cats[index]['icon'],
                    txt: cats[index]['txt'],
                    active: cats[index]['active'],
                  );
                },
              ),
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Best Selling",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsPage(
                        image: products[index]['img']!,
                        name: products[index]['title']!,
                        description: products[index]['des']!,
                        price: products[index]['price']!,
                      ),
                    ),
                  );
                },
                child: ProductsItem(
                  image: products[index]['img']!,
                  name: products[index]['title']!,
                  description: products[index]['des']!,
                  price: products[index]['price']!,
                ),
              );
            },
          ),
        ),
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
                          ? const Color.fromARGB(255, 84, 65, 129) 
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
                          ? const Color.fromARGB(255, 84, 65, 129) 
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
                          ? const Color.fromARGB(255, 84, 65, 129) 
                          : Colors.grey, 
                    ),
                  ),
                ],
              )),
        )
      ],
              ),
            ),
    );
  }
}
