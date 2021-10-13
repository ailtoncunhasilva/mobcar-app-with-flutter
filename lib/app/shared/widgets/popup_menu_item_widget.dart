import 'package:flutter/material.dart';
import 'package:mobcar_app/app/core/const.dart';

enum MenuOption { View, Edit, Delete }

class PopupMenuItemWidget extends StatelessWidget {
  final VoidCallback onPressedView;
  final VoidCallback onPressedEdit;
  final VoidCallback onPressedDelete;

  PopupMenuItemWidget({
    required this.onPressedView,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      itemBuilder: (context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            padding: EdgeInsets.only(left: kSpacing),
            child: TextButton(
              onPressed: onPressedView,
              child: Text('View'),
            ),
          ),
          PopupMenuItem(
            padding: const EdgeInsets.only(left: kSpacing),
            child: TextButton(
              onPressed: onPressedEdit,
              child: Text('Edit'),
            ),
          ),
          PopupMenuItem(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing),
            child: TextButton(
              onPressed: onPressedDelete,
              child: Text('Delete'),
            ),
          ),
        ];
      },
    );
  }
}
