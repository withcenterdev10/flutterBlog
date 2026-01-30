import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterblognew/providers/auth_provider.dart';
import 'package:flutterblognew/utils/consts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterblognew/providers/auth_provider.dart';

class BlogDrawer extends ConsumerStatefulWidget {
  const BlogDrawer({super.key});

  @override
  ConsumerState createState() {
    return _BlogDrawerState();
  }
}

class _BlogDrawerState extends ConsumerState<BlogDrawer> {
  @override
  Widget build(BuildContext context) {
    void handleLogout() async {
      try {
        await ref.read(authProvider.notifier).logout();

        if (context.mounted) {
          Navigator.of(context).pop();
          context.go('/');
        }
      } catch (error) {
        print(error);
      } finally {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Something went wrong")));
        }
      }
    }

    void navigateToProfile() async {
      context.go('/${Pages.profile.name}');
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.book,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text('Blogs', style: Theme.of(context).textTheme.titleLarge!),
              ],
            ),
          ),
          ListTile(title: Text('Profile'), onTap: navigateToProfile),
          const Spacer(),
          ListTile(title: Text('Logout'), onTap: handleLogout),
          // many more...
        ],
      ),
    );
  }
}
