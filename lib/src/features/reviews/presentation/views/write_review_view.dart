import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import '../../application/review_view_model.dart';

class WriteReviewView extends ConsumerStatefulWidget {
  final ReviewViewModel reviewViewModel;

  const WriteReviewView({
    super.key,
    required this.reviewViewModel,
  });

  @override
  ConsumerState<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends ConsumerState<WriteReviewView> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final reviewViewModel = widget.reviewViewModel;

    return BaseModalBodyWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sua avaliação'),
        ),
        body: FutureBuilder(
          future: reviewViewModel.canWriteReview(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: LoadingWidget())
              : snapshot.data == true
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const RatingStarsFieldWidget(),
                          const SizedBox(height: 16),
                          TextField(
                            controller: commentController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 4,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Você pode deletar sua avaliação a qualquer momento, basta arrastar a avaliação para a direita na lista de avaliações.',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const Gap(8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.tertiary,
                              ),
                              onPressed: () async {
                                await reviewViewModel
                                    .writeReview(
                                        rating: ref.read(ratingCounterProvider),
                                        review: commentController.text)
                                    .catchError(
                                  (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Erro ao enviar avaliação: $error',
                                        ),
                                      ),
                                    );
                                  },
                                ).then(
                                  (_) async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Avaliação enviada com sucesso'),
                                      ),
                                    );
                                    await reviewViewModel.refreshList().then(
                                      (_) {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Enviar',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onTertiary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      heightFactor: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: colorScheme.primary,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Avaliações disponíveis apenas para clientes',
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Você precisa fazer uma compra de um item deste negócio para poder avaliar.',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}

class RatingStarsFieldWidget extends ConsumerWidget {
  const RatingStarsFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingCounterProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: colorScheme.tertiary,
          ),
          onPressed: () {
            ref.read(ratingCounterProvider.notifier).setState(index + 1);
          },
        );
      }),
    );
  }
}
