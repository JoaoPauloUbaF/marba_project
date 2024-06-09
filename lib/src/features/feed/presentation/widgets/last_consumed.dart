import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// Defina uma lista de dados para as categorias populares
final List<Map<String, dynamic>> popularServices = [
  {'icon': Icons.home, 'text': 'Conserto de Eletrodomésticos'},
  {'icon': Icons.flash_on, 'text': 'Eletricista'},
  {'icon': Icons.water_drop_sharp, 'text': 'Encanador'},
  {'icon': Icons.tv, 'text': 'Serviços de TV a Cabo'},
  {'icon': Icons.pool, 'text': 'Limpeza de Piscinas'},
  {'icon': Icons.landscape, 'text': 'Jardineiro'},
  {'icon': Icons.cleaning_services, 'text': 'Limpeza de Vidros'},
  {'icon': Icons.brush, 'text': 'Pintor(a)'},
  {'icon': Icons.person, 'text': 'Babá'},
];

class PopularServicesWidget extends StatelessWidget {
  const PopularServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Serviços Populares',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap(8),
        SizedBox(
          height: 100,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: popularServices.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8.0,
              mainAxisExtent: 150.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return PopularServiceTile(
                icon: popularServices[index]['icon'],
                text: popularServices[index]['text'],
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularServiceTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const PopularServiceTile({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Popular Services'),
      ),
      body: const Center(
        child: PopularServicesWidget(),
      ),
    ),
  ));
}
