import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/features/reviews/application/review_view_model.dart';
import 'package:project_marba/src/features/reviews/presentation/widgets/review_card_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewListWidget extends ConsumerStatefulWidget {
  final ReviewViewModel reviewViewModel;

  const ReviewListWidget({
    super.key,
    required this.reviewViewModel,
  });

  @override
  ReviewListWidgetState createState() => ReviewListWidgetState();
}

class ReviewListWidgetState extends ConsumerState<ReviewListWidget> {
  static const _pageSize = 5;
  final PagingController<int, ReviewModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final newItems = await widget.reviewViewModel.fetchReviews(
        limit: _pageSize,
        lastReviewId: pageKey == 0 ? null : _pagingController.itemList?.last.id,
      );

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(widget.reviewViewModel.getReviewsProvider()).whenOrNull(
      data: (reviews) {
        _pagingController.refresh();
      },
    );

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.sync(() {
            _pagingController.refresh();
          });
        },
        child: PagedListView<int, ReviewModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<ReviewModel>(
            itemBuilder: (context, item, index) =>
                ReviewCardWidget(review: item),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('Nenhuma avaliação encontrada'),
            ),
            noMoreItemsIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Fim das avaliações'),
              ),
            ),
            newPageErrorIndicatorBuilder: (context) =>
                const Center(child: Text('Erro ao carregar avaliações')),
            firstPageErrorIndicatorBuilder: (context) =>
                const Center(child: Text('Erro ao carregar avaliações')),
          ),
        ),
      ),
    );
  }
}
