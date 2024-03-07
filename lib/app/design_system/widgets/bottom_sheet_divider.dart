import '../design_system.dart';

class BottomSheetTopDivider extends StatelessWidget {
  const BottomSheetTopDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Center(
        child: Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.textSecondary,
            borderRadius: BorderRadius.circular(1.5),
          ),
        ),
      ),
    );
  }
}
