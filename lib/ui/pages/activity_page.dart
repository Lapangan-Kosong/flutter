import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/activity/activity.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/common_message.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ActivityPage extends ConsumerWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Menus.addActivity.go(context, ref),
        child: Icon(
          Icons.add_rounded,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            PageTitle(
              menu: Menus.activity,
            ),
            Expanded(
              child: _ActivityList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityList extends ConsumerStatefulWidget {
  const _ActivityList();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __ActivityListState();
}

class __ActivityListState extends ConsumerState<_ActivityList> {
  final _pagingController = PagingController<int, Activity>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await ref.read(pagedActivityProvider(page).future);
      final isLastPage = data?.last == true;
      final newItems = data?.items ?? [];

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        _pagingController.appendPage(newItems, page + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Activity>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Activity>(
        itemBuilder: (context, item, index) => _ActivityTile(item),
        noItemsFoundIndicatorBuilder: (context) =>
            buildCommonMessage('No data found', StackTrace.current),
        firstPageErrorIndicatorBuilder: (context) => buildCommonMessage(
          _pagingController.error,
          StackTrace.current,
          onTap: () => _pagingController.refresh(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class _ActivityTile extends ConsumerWidget {
  const _ActivityTile(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return InkWell(
      // borderRadius: Dimensions.commonCircularCorner,
      // onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.mediumSize,
          vertical: Dimensions.smallSize,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.highlightColor,
          ),
          // borderRadius: Dimensions.commonCircularCorner,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.smallSize,
              ),
              child: Icon(
                Icons.edit_rounded,
                color: colorScheme.primary,
                size: Dimensions.mediumSize,
              ),
            ),
            StaticWidget.hMediumPadding,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    activity.formattedDateTime ?? '-',
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    activity.activity ?? '-',
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
