import 'package:flutter/material.dart';
import 'package:modern_vet_submission/src/core/constants/image_constant.dart';
import 'package:modern_vet_submission/src/core/helpers/image_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;
  const CustomAppBar({
    super.key,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: onBackPressed,
        child: ImageHelper.loadImage(
          ImageConstant.icBack,
        ),
      ),
    );
  }
}
