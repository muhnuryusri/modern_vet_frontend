import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/presentation/components/custom_item.dart';

import '../../domain/entity/feedback_entity.dart';

class CustomListView extends StatelessWidget {
  final List<FeedbackEntity> items;
  final Function(FeedbackEntity) onItemTap;

  const CustomListView({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomItem(
            rating: item.rating,
            name: item.name,
            petName: item.petName,
            onTap: () => onItemTap(item),
          );
        },
      ),
    );
  }
}
