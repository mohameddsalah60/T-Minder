import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class TitleAndValueRow extends StatelessWidget {
  const TitleAndValueRow({
    super.key,
    required this.title,
    this.value,
    this.child,
  });
  final String? title, value;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyles.regular16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 8,
          ),
          child ??
              Expanded(
                child: Text(
                  value ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bold16,
                ),
              ),
        ],
      ),
    );
  }
}
