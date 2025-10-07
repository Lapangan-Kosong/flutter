import 'package:abs/constant/dimension.dart';
import 'package:abs/models/activity/post_activity.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/debug_widget.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _postProvider =
    StateProvider.autoDispose.family<PostActivity, int?>((ref, id) {
  final user = ref.read(userProvider);

  final now = DateTime.now();
  final tanggal =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  return PostActivity(
    nip: user?.name,
    tanggal: tanggal,
  );
});

final _isPostingProvider = StateProvider.autoDispose<bool>((ref) => false);

class AddActivityPage extends ConsumerWidget {
  const AddActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final id = null;

    final post = ref.watch(_postProvider(id));
    final isPosting = ref.watch(_isPostingProvider);

    final nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageTitle(
              menu: Menus.addActivity,
            ),
            DebugWidget(map: post.toMap()),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.mediumSize,
                vertical: Dimensions.smallSize,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Detail Aktivitas',
                  hintText: 'Masukkan aktivitas di sini',
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
                  ref.read(_postProvider(id).notifier).state = post.copyWith(
                    activity: string.trim(),
                  );
                },
                enabled: !isPosting,
                maxLines: null,
                textInputAction: TextInputAction.newline,
              ),
            ),
            TextButton(
              onPressed: post.isValid && !isPosting
                  ? () {
                      ref.read(_isPostingProvider.notifier).state = true;
                      final client = ref.read(apiProvider);
                      client.postActivity(post: post).then((result) {
                        if (result) {
                          // sukses

                          nav.pop();
                        } else {
                          // gagal
                        }
                      }).catchError((error) {
                        debugPrint('post activity => $error');
                      }).whenComplete(() {
                        ref.invalidate(_isPostingProvider);
                        ref.invalidate(_postProvider(id));
                      });
                    }
                  : null,
              child: Text(
                isPosting ? 'Menyimpan aktivitas ...' : 'Simpan',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: post.isValid && !isPosting
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: post.isValid && !isPosting
                      ? Colors.green
                      : theme.disabledColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
