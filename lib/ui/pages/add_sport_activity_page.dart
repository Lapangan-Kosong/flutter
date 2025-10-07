import 'package:abs/constant/dimension.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/models/paged_params.dart';
import 'package:abs/models/sport_activities/post_sport_activity.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/controller/navigation/routes.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/debug_widget.dart';
import 'package:abs/ui/widget/illustration.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _postProvider =
    StateProvider.autoDispose.family<PostSportActivity, int?>((ref, id) {
  final user = ref.read(userProvider);
  final sportCategoryId = ref.watch(sportCategoryIdProvider);

  final tomorrow = DateTime.now().add(Duration(days: 1));
  final activityDate =
      '${tomorrow.year}-${tomorrow.month.toString().padLeft(2, '0')}-${tomorrow.day.toString().padLeft(2, '0')}';

  return PostSportActivity(
    activityDate: activityDate,
    sportCategoryId: sportCategoryId,
  );
});

final _isPostingProvider = StateProvider.autoDispose<bool>((ref) => false);

class AddSportActivityPage extends ConsumerWidget {
  const AddSportActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final id = null;

    final post = ref.watch(_postProvider(id));
    final isPosting = ref.watch(_isPostingProvider);

    final sportCategoryName = ref.watch(sportCategoryNameProvider);
    final sportCategoryId = ref.watch(sportCategoryIdProvider);

    final nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageTitle(
                menu: AppsMenu(
                  id: AppsMenuId.addActivity,
                  title: 'Tambah Aktivitas ${sportCategoryName}',
                  route: Routes.addActivity,
                  image: Illustration.activity,
                ),
              ),
              DebugWidget(map: post.toMap()),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.mediumSize,
                  vertical: Dimensions.smallSize,
                ),
                child: Column(
                  children: [
                    // Title Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Judul Aktivitas',
                        hintText: 'Masukkan judul aktivitas',
                        prefixIcon: Icon(Icons.title_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (string) {
                        ref.read(_postProvider(id).notifier).state =
                            post.copyWith(
                                title: string.trim(),
                                sportCategoryId: sportCategoryId,
                                mapUrl:
                                    "https://maps.app.goo.gl/h1AV4bfB2cojJMxK7");
                      },
                      enabled: !isPosting,
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Description Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Deskripsi',
                        hintText: 'Masukkan deskripsi aktivitas',
                        prefixIcon: Icon(Icons.edit_note_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (string) {
                        ref.read(_postProvider(id).notifier).state =
                            post.copyWith(
                          description: string.trim(),
                        );
                      },
                      enabled: !isPosting,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Address Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        hintText: 'Masukkan alamat lokasi',
                        prefixIcon: Icon(Icons.location_on_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      onChanged: (string) {
                        ref.read(_postProvider(id).notifier).state =
                            post.copyWith(
                          address: string.trim(),
                        );
                      },
                      enabled: !isPosting,
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Activity Date Field
                    GestureDetector(
                      onTap: isPosting
                          ? null
                          : () async {
                              final tomorrow =
                                  DateTime.now().add(Duration(days: 1));
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: tomorrow,
                                firstDate: tomorrow,
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );
                              if (selectedDate != null) {
                                final formattedDate =
                                    '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                                ref.read(_postProvider(id).notifier).state =
                                    post.copyWith(activityDate: formattedDate);
                              }
                            },
                      child: AbsorbPointer(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Tanggal Aktivitas',
                            hintText: 'Pilih tanggal aktivitas',
                            prefixIcon: Icon(Icons.calendar_today_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintStyle: textTheme.titleSmall?.copyWith(
                              color: theme.disabledColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                          controller:
                              TextEditingController(text: post.activityDate),
                          enabled: !isPosting,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // City ID Field
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        labelText: 'Kota',
                        hintText: 'Pilih kota',
                        prefixIcon: Icon(Icons.location_city_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      initialValue: post.cityId,
                      items: const [
                        DropdownMenuItem(
                          value: 3171,
                          child: Text('Jakarta Selatan'),
                        ),
                        DropdownMenuItem(
                          value: 3172,
                          child: Text('Jakarta Timur'),
                        ),
                        DropdownMenuItem(
                          value: 3173,
                          child: Text('Jakarta Pusat'),
                        ),
                        DropdownMenuItem(
                          value: 3174,
                          child: Text('Jakarta Barat'),
                        ),
                        DropdownMenuItem(
                          value: 3175,
                          child: Text('Jakarta Utara'),
                        ),
                      ],
                      onChanged: isPosting
                          ? null
                          : (value) {
                              ref.read(_postProvider(id).notifier).state =
                                  post.copyWith(
                                cityId: value,
                              );
                            },
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Price Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Harga',
                        hintText: 'Masukkan harga',
                        prefixIcon: Icon(Icons.money_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (string) {
                        ref.read(_postProvider(id).notifier).state =
                            post.copyWith(
                          price: int.tryParse(string.trim()),
                        );
                      },
                      enabled: !isPosting,
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Slot Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Slot',
                        hintText: 'Masukkan jumlah slot',
                        prefixIcon: Icon(Icons.people_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (string) {
                        final slotValue = int.tryParse(string.trim());
                        String? calculatedEndTime;

                        if (slotValue != null && post.startTime != null) {
                          final timeParts = post.startTime!.split(':');
                          if (timeParts.length == 2) {
                            final startHour = int.tryParse(timeParts[0]);
                            final startMinute = int.tryParse(timeParts[1]);

                            if (startHour != null && startMinute != null) {
                              final endHour = (startHour + slotValue) % 24;
                              calculatedEndTime =
                                  '${endHour.toString().padLeft(2, '0')}:${startMinute.toString().padLeft(2, '0')}';
                            }
                          }
                        }

                        ref.read(_postProvider(id).notifier).state =
                            post.copyWith(
                          slot: slotValue,
                          endTime: calculatedEndTime,
                        );
                      },
                      enabled: !isPosting,
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // Start Time Field
                    GestureDetector(
                      onTap: isPosting
                          ? null
                          : () async {
                              final selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (selectedTime != null) {
                                final formattedTime =
                                    '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';

                                String? calculatedEndTime;
                                if (post.slot != null) {
                                  final endHour =
                                      (selectedTime.hour + post.slot!) % 24;
                                  calculatedEndTime =
                                      '${endHour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                                }

                                ref.read(_postProvider(id).notifier).state =
                                    post.copyWith(
                                  startTime: formattedTime,
                                  endTime: calculatedEndTime,
                                );
                              }
                            },
                      child: AbsorbPointer(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Waktu Mulai',
                            hintText: 'HH:MM',
                            prefixIcon: Icon(Icons.access_time_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintStyle: textTheme.titleSmall?.copyWith(
                              color: theme.disabledColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                          controller:
                              TextEditingController(text: post.startTime),
                          enabled: !isPosting,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.smallSize),

                    // End Time Field (Auto-calculated based on slot)
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Waktu Selesai (Otomatis)',
                        hintText: 'HH:MM',
                        prefixIcon: Icon(Icons.access_time_filled_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: textTheme.titleSmall?.copyWith(
                          color: theme.disabledColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      controller: TextEditingController(text: post.endTime),
                      enabled: false,
                      style: textTheme.bodyLarge?.copyWith(
                        color: theme.disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.mediumSize),
              TextButton(
                onPressed: _isValidPost(post) && !isPosting
                    ? () {
                        ref.read(_isPostingProvider.notifier).state = true;
                        final client = ref.read(apiProvider);
                        final scaffold = ScaffoldMessenger.of(context);
                        client.postSportActivity(post: post).then((result) {
                          if (result) {
                            // sukses
                            // Invalidate sport activity provider to refresh the list
                            final sportCategoryId = ref.read(sportCategoryIdProvider);
                            final params = PagedParams(sportCategoryId, 1);
                            ref.invalidate(pagedSportActivityProvider(params));

                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text('Aktivitas berhasil disimpan'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            nav.pop();
                          } else {
                            // gagal
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text('Gagal menyimpan aktivitas'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }).catchError((error) {
                          debugPrint('post sport activity => $error');
                          scaffold.showSnackBar(
                            SnackBar(
                              content: Text('Error: ${error.toString()}'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }).whenComplete(() {
                          ref.invalidate(_isPostingProvider);
                          ref.invalidate(_postProvider(id));
                        });
                      }
                    : null,
                child: Text(
                  isPosting ? 'Menyimpan aktivitas ...' : 'Simpan',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: _isValidPost(post) && !isPosting
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _isValidPost(post) && !isPosting
                        ? Colors.green
                        : theme.disabledColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidPost(PostSportActivity post) {
    return
        // post.sportCategoryId != null &&
        // post.sportCategoryId! > 0 &&
        post.title != null &&
            post.title!.isNotEmpty &&
            post.description != null &&
            post.description!.isNotEmpty &&
            post.activityDate != null &&
            post.activityDate!.isNotEmpty &&
            post.startTime != null &&
            post.startTime!.isNotEmpty &&
            post.endTime != null &&
            post.endTime!.isNotEmpty &&
            post.slot != null &&
            post.slot! > 0 &&
            post.cityId != null;
  }
}
