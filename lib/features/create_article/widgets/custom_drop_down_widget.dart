import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  const CategoryDropdown({
    super.key,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Find the button’s position & size
        final RenderBox button = context.findRenderObject() as RenderBox;
        final overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final buttonRect =
            button.localToGlobal(Offset.zero, ancestor: overlay) & button.size;

        // Show a menu whose top edge is flush with the bottom of the button
        final selected = await showMenu<String>(
          context: context,
          position: RelativeRect.fromRect(
            Rect.fromLTWH(
              buttonRect.left,
              buttonRect.bottom,
              buttonRect.width,
              0,
            ),
            Offset.zero & overlay.size,
          ),
          items: [
            const PopupMenuItem(value: 'Health', child: Text('Health')),
            const PopupMenuItem(value: 'Fitness', child: Text('Fitness')),
            const PopupMenuItem(value: 'Food', child: Text('Food')),
            const PopupMenuItem(
              value: '__create_new__',
              child: Text('Create a new category'),
            ),
          ],
          elevation: 8,
        );

        // Handle selection
        if (selected == '__create_new__') {
          // Navigator.of(context).pushNamed('/create-category');
        } else if (selected != null) {
          onChanged(selected);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: value ?? 'Select a category',
          prefixIcon: const Icon(Icons.category),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        child: Text(
          value ?? '',
          // style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
