import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pract/configs/configs.dart';
import 'package:pract/statics/app_statics.dart';


class UploadMediaField extends StatelessWidget {
  final String name;
  final Future<String?> Function()? onPickFile;

  const UploadMediaField({super.key, required this.name, this.onPickFile});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<String>>(
      name: name,
      initialValue: const [],
      builder: (field) {
        final files = field.value ?? [];
        final hasFiles = files.isNotEmpty;

        return GestureDetector(
          onTap: () async {
            final picked = await onPickFile?.call() ?? "dummy_file.pdf";

            final updated = List<String>.from(files)..add(picked);
            field.didChange(updated);
          },
          child: Container(
            width: double.infinity,
            padding: Space.all(12, 16),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
            ),
            child: Column(
              children: [
                /// Upload Icon Circle
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.c.secondary.shade300,
                    border: Border.all(
                      color: AppTheme.c.secondary.shade500!,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/Attachment Icon.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),

                Space.yf(10),

                /// Title
                Text("Upload Media", style: AppText.b1!.w(6)),

                /// Subtitle
                Text(
                  "Supported formats: pdfs, mp4, jpg",
                  style: AppText.l1bm!.cl(AppTheme.c.text.main!),
                ),

                /// 👇 Show divider + tiles ONLY when files exist
                if (hasFiles) ...[
                  Space.yf(16),
                  Divider(color: AppTheme.c.lightGrey.main),
                  Space.yf(10),

                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(files.length, (i) {
                      return _MediaTile(
                        onRemove: () {
                          final updated = List<String>.from(files)..removeAt(i);
                          field.didChange(updated);
                        },
                      );
                    }),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MediaTile extends StatelessWidget {
  final VoidCallback onRemove;

  const _MediaTile({required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 56.35.w,
          height: 45.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.5.r),
            image: DecorationImage(
              image: AssetImage('assets/pngs/pdf_placeholder.png'),
              colorFilter: ColorFilter.mode(
                AppTheme.c.black!.withValues(alpha: 0.2),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4.29,
          right: 4.29,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 13.95.w,
              height: 13.95.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.c.background.main,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppStaticData.cross,
                  height: 7.5.h,
                  width: 7.5.h,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(6.5.r),
            ),
            child: SvgPicture.asset('assets/svgs/doc.svg'),
          ),
        ),
      ],
    );
  }
}
