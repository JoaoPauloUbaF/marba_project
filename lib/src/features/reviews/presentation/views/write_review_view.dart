import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/base_modal_body_widget.dart';
import '../../application/review_view_model_provider.dart';

class WriteReviewView extends ConsumerStatefulWidget {
  final String uid;
  final ReviewViewModelType type;

  const WriteReviewView({
    super.key,
    required this.uid,
    required this.type,
  });

  @override
  ConsumerState<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends ConsumerState<WriteReviewView> {
  double _rating = 0;
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final reviewViewModel =
        ref.read(reviewViewModelProvider(type: widget.type, widgetRef: ref));

    return BaseModalBodyWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sua avaliação'),
        ),
        body: reviewViewModel.canWriteReview(widget.uid)
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: colorScheme.tertiary,
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = index + 1.0;
                            });
                          },
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.tertiary,
                        ),
                        onPressed: () {
                          reviewViewModel.writeReview(
                              '', widget.uid, _rating, commentController.text);
                          Navigator.of(context).pop(true);
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
                      'Você precisa fazer uma compra para poder avaliar este produto.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
