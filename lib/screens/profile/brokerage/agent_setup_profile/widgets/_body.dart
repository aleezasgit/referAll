part of '../agent_setup_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return AnimatedBuilder(
      animation: state, // 🔥 only listen to state now
      builder: (context, _) {
        /// 🔹 Fixed list of 2 steps
        final steps = const [Step1(), Step2(), Step3()];

        final stepId = state.currentStep.toString();
        final formKey =
            state._formKeys[stepId] ?? GlobalKey<FormBuilderState>();

        if (!state._formKeys.containsKey(stepId)) {
          state.registerFormKey(stepId, formKey);
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            type: AppBarType.stepper,
            onBackPressed: () {
              if (state.currentStep > 0) {
                state.previous();
              } else {
                Navigator.of(context).maybePop();
              }
            },
            space: 14.5,
            stepperWidget: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: LinearProgressIndicator(
                        value: state.progress,

                        minHeight: 7.h,
                        backgroundColor: AppTheme.c.white!,
                        valueColor: AlwaysStoppedAnimation(
                          AppTheme.c.primary.main!,
                        ),
                      ),
                    ),
                  ),
                  Space.xf(14.5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${state.currentStep + 1}',
                          style: AppText.b1b!.cl(AppTheme.c.text.shade800!),
                        ),
                        TextSpan(
                          text: '/${state.totalSteps}',
                          style: AppText.b1!.w(6).cl(AppTheme.c.text.shade800!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🧾 Form
          body: FormBuilder(
            key: formKey,
            initialValue: state.getInitialValues(stepId),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: Space.hf(16),
                    child: Column(
                      children: [steps[state.currentStep], Space.yf(40)],
                    ),
                  ),
                ),

                // /// 🔹 Bottom CTA
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 24.w,
                //     right: 24.w,
                //     bottom: MediaQuery.of(context).padding.bottom + 10.h,
                //   ),
                //   child: AppButton(
                //     label: 'Continue',
                //     onPressed: state.currentStep == state.totalSteps - 1
                //         ? () => state.submit(context)
                //         : state.next,
                //   ),
                // ),
              ],
            ),
          ),

          /// 🔹 Floating Buttons (FAB style, same AppButtons)
          floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  label: 'Continue',
                  onPressed: () {
                    if (state.currentStep == state.totalSteps - 1) {
                      state.submit(context);
                    } else {
                      state.next();
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
