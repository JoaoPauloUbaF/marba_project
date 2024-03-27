import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/widgets/medium_vertical_space_widget.dart';

class DiscountCouponModal extends StatelessWidget {
  const DiscountCouponModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpaceMediumWidget(),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .5,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const VerticalSpaceMediumWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              hintText: 'Código do Cupom',
              suffixIcon: IconButton(
                icon: const Icon(Icons.done_sharp),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Cupom de Desconto'),
              subtitle: Text('Desconto de 10%'),
              trailing: IconButton(
                icon: Icon(Icons.check_circle_sharp),
                onPressed: () {},
              ),
            );
          },
          itemCount: 2,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
