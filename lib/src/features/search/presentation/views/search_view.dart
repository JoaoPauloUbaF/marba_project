import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Do que você precisa?",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // Add your search field here
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Eletricista, Barbeiro, Martelo, Vaso...",
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ),
                ),
              ),
              CarouselSlider(
                  items:
                      // Add your search categories here
                      const [
                    Card(
                      child: Center(child: Text("Eletricista")),
                    ),
                    Card(
                      child: Center(child: Text("Barbeiro")),
                    ),
                    Card(
                      child: Center(child: Text("Martelo")),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
