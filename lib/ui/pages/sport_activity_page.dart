import 'package:abs/models/sport_activities/sport_activities.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SportActivityPage extends ConsumerStatefulWidget {
  const SportActivityPage({super.key});

  @override
  ConsumerState<SportActivityPage> createState() => _SportActivityPageState();
}

class _SportActivityPageState extends ConsumerState<SportActivityPage> {
  final ScrollController _scrollController = ScrollController();
  final List<SportActivity> _activities = [];
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoadingMore &&
        _hasMoreData) {
      _loadMoreData();
    }
  }

  Future<void> _loadInitialData() async {
    final sportCategoryId = ref.read(sportCategoryIdProvider);
    final params = PagedParams(sportCategoryId, _currentPage);
    final activities =
        await ref.read(pagedSportActivityProvider(params).future);

    if (mounted) {
      setState(() {
        _activities.clear();
        if (activities != null && activities.isNotEmpty) {
          _activities.addAll(activities);
          _hasMoreData = activities.length >= 10; // Assuming 10 items per page
        } else {
          _hasMoreData = false;
        }
      });
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoadingMore || !_hasMoreData) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      _currentPage++;
      final sportCategoryId = ref.read(sportCategoryIdProvider);
      final params = PagedParams(sportCategoryId, _currentPage);
      final activities =
          await ref.read(pagedSportActivityProvider(params).future);

      if (mounted) {
        setState(() {
          if (activities != null && activities.isNotEmpty) {
            _activities.addAll(activities);
            _hasMoreData = activities.length >= 10;
          } else {
            _hasMoreData = false;
          }
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingMore = false;
          _currentPage--; // Revert page increment on error
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading data: $e')),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    _currentPage = 1;
    _hasMoreData = true;
    await _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    final sportCategoryId = ref.watch(sportCategoryIdProvider);
    final sportCategoryName = ref.watch(sportCategoryNameProvider);
    final params = PagedParams(sportCategoryId, 1);
    final initialData = ref.watch(pagedSportActivityProvider(params));

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF0),
      appBar: AppBar(
        title: Text(sportCategoryName),
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: _activities.isEmpty
              ? initialData.when(
                  data: (activities) {
                    if (activities == null || activities.isEmpty) {
                      return const Center(
                        child: Text(
                          'No activities found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, stack) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline,
                            size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          'Error: $error',
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _onRefresh,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _activities.length + (_hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _activities.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final activity = _activities[index];
                    return _ActivityCard(activity: activity);
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new sport activity page
          // TODO: Implement navigation to create sport activity page
        },
        backgroundColor: const Color(0xFF1E3A5F),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final SportActivity activity;

  const _ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to detail page
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                activity.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A5F),
                ),
              ),
              const SizedBox(height: 8),

              // Sport Category
              if (activity.sportCategory?.name != null)
                Row(
                  children: [
                    const Icon(Icons.sports, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      activity.sportCategory!.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              // Date and Time
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    activity.activityDate ?? '-',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${activity.startTime ?? '-'} - ${activity.endTime ?? '-'}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Location
              if (activity.address != null)
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        activity.address!,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),

              // City
              if (activity.city?.cityName != null)
                Row(
                  children: [
                    const Icon(Icons.location_city,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      activity.city!.cityName!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              const SizedBox(height: 12),

              // Price and Slots
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Row(
                    children: [
                      const Icon(Icons.payment,
                          size: 18, color: Color(0xFF1E3A5F)),
                      const SizedBox(width: 4),
                      Text(
                        activity.priceDiscount != null
                            ? 'Rp ${activity.priceDiscount}'
                            : 'Rp ${activity.price ?? 0}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                    ],
                  ),

                  // Slots
                  Row(
                    children: [
                      const Icon(Icons.people, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${activity.slot ?? 0} slots',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Organizer
              if (activity.organizer?.name != null) ...[
                const SizedBox(height: 12),
                const Divider(),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFF1E3A5F),
                      child: Icon(Icons.person, size: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'By ${activity.organizer!.name}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
