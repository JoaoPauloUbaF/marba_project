import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

class OrderAddressTileWidget extends StatelessWidget {
  const OrderAddressTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.location_on_sharp, size: 30),
        ),
      ),
      title: Text(
        'Rua dos Bobos, 0 - São Paulo - SP',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return OrderAddressModalWidget();
            },
          );
        },
      ),
    );
  }
}

class OrderAddressModalWidget extends ConsumerWidget {
  const OrderAddressModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    return Container(
      child: user.when(
        data: (user) {
          final userAddress = user?.address;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 4,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Selecione o endereço de entrega',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.location_on_sharp, size: 30),
                      title: Text(
                          '${userAddress!.street}, ${userAddress.number}, ${userAddress.neighborhood}, ${userAddress.city}'),
                      subtitle: const Text('Casa'),
                      trailing: Radio(
                        value: index,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Form(
                            child: Column(
                              children: [
                                Text('Adicionar novo endereço'),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Rua',
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Número',
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Bairro',
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Cidade',
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Adicionar'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Adicionar novo endereço',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Erro: $error'),
      ),
    );
  }
}
