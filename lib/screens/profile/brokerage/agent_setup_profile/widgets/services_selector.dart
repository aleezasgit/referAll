part of '../agent_setup_profile.dart';

class SpecialitiesSelector extends StatefulWidget {
  final String name;
  final List<String> options;
  final String title;

  const SpecialitiesSelector({
    super.key,
    required this.name,
    required this.options,
    this.title = "Specialties",
  });

  @override
  State<SpecialitiesSelector> createState() => _SpecialitiesSelectorState();
}

class _SpecialitiesSelectorState extends State<SpecialitiesSelector> {
  final List<String> _selected = [];
  bool _isOpen = false;

  void _toggleDropdown() {
    setState(() => _isOpen = !_isOpen);
  }

  void _onSelect(String value) {
    setState(() {
      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Main Container
        GestureDetector(
          onTap: _toggleDropdown,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: double.infinity,
            padding: Space.all(14, 12),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(
                color: _isOpen
                    ? AppTheme.c.primary.main!
                    : AppTheme.c.lightGrey.main!,
                width: 1.w,
              ),
            ),
            child: Row(
              children: [
                /// Chips
                Expanded(
                  child: _selected.isEmpty
                      ? Text(
                          "Select Specialties",
                          style: AppText.b1!.copyWith(
                            color: AppTheme.c.text.shade800,
                          ),
                        )
                      : Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: _selected.map((item) {
                            return _SelectedChip(
                              label: item,
                              onRemove: () => _onSelect(item),
                            );
                          }).toList(),
                        ),
                ),

                /// Arrow
                AnimatedRotation(
                  turns: _isOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.keyboard_arrow_down_rounded, size: 24.sp),
                ),
              ],
            ),
          ),
        ),

        /// Dropdown List
        if (_isOpen) ...[
          Space.yf(10),
          Container(
            width: double.infinity,
            padding: Space.all(8),
            decoration: BoxDecoration(
              color: AppTheme.c.white,
              borderRadius: UIProps.radiusM,
              border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
              boxShadow: [
                BoxShadow(
                  color: Color(0x080D0D12),
                  blurRadius: 16,
                  spreadRadius: -4,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: widget.options.map((option) {
                final isSelected = _selected.contains(option);

                return InkWell(
                  onTap: () => _onSelect(option),
                  child: Padding(
                    padding: Space.all(12),
                    child: Row(
                      children: [
                        /// Circle Check
                        Container(
                          height: 16.h,
                          width: 16.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.c.secondary.shade600!
                                  : AppTheme.c.lightGrey.main!,
                              width: 1.w,
                            ),
                            color: isSelected
                                ? AppTheme.c.secondary.main!
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? Center(
                                  child: SvgPicture.asset(
                                    'assets/svgs/tick.svg',
                                    width: 11.2.w,
                                    height: 11.2.h,
                                  ),
                                )
                              : null,
                        ),

                        Space.xf(12),

                        Text(option, style: AppText.b1bm),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}

class _SelectedChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _SelectedChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(8, 1),
      decoration: BoxDecoration(
        color: AppTheme.c.secondary.shade100,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppText.b1bm!.copyWith(
              color: AppTheme.c.text.shade800,
              height: 1.5,
            ),
          ),
          Space.xf(4),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, size: 15.sp),
          ),
        ],
      ),
    );
  }
}
